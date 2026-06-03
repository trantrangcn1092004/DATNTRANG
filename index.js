// import lib
const ejs = require('ejs');
const path = require('path')
const express = require('express')
const util = require('util')
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')
const OpenAI = require('openai')
require('dotenv').config();
const app = express()
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY
})

// connect to db
const db = require('./src/config/db/connect');
const query = util.promisify(db.query).bind(db)

const cfg = require('./src/config/index')
const route = require('./src/routes/index')

// set view engine
app.set('views', path.join(__dirname, 'src', 'views'));
app.set('view engine', 'ejs');

// use static folder
app.use(express.static(path.join('src', 'public')))

//parse URL-encoded bodies
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }))
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser('secret'))

//app.use('/', require('./routes/index'))
// AI chatbot tư vấn và gợi ý sản phẩm
// ================= AI CHATBOT GỢI Ý SẢN PHẨM NÂNG CẤP =================

function removeVietnameseTones(str) {
  return String(str || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/đ/g, 'd')
    .replace(/Đ/g, 'D')
    .toLowerCase();
}

function stripHtml(html) {
  return String(html || '')
    .replace(/&nbsp;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/<[^>]*>/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function formatMoney(value) {
  return Number(value || 0).toLocaleString('vi-VN') + 'đ';
}

function convertMoney(numberText, unitText) {
  const number = Number(String(numberText).replace(',', '.'));
  const unit = removeVietnameseTones(unitText || '');

  if (unit.includes('trieu') || unit === 'tr' || unit === 'm') {
    return number * 1000000;
  }

  if (unit.includes('nghin') || unit === 'k') {
    return number * 1000;
  }

  return number;
}

function extractPriceRange(message) {
  const text = removeVietnameseTones(message);

  const between = text.match(/tu\s*(\d+(?:[.,]\d+)?)\s*(trieu|tr|m|nghin|k)?\s*(?:den|toi|-)\s*(\d+(?:[.,]\d+)?)\s*(trieu|tr|m|nghin|k)?/);
  if (between) {
    const unit1 = between[2] || between[4];
    const unit2 = between[4] || between[2];

    return {
      min: convertMoney(between[1], unit1),
      max: convertMoney(between[3], unit2)
    };
  }

  const maxMatch = text.match(/(?:duoi|nho hon|khong qua|toi da|tam|khoang)\s*(\d+(?:[.,]\d+)?)\s*(trieu|tr|m|nghin|k)?/);
  if (maxMatch) {
    return {
      min: null,
      max: convertMoney(maxMatch[1], maxMatch[2])
    };
  }

  const minMatch = text.match(/(?:tren|lon hon|tu)\s*(\d+(?:[.,]\d+)?)\s*(trieu|tr|m|nghin|k)/);
  if (minMatch) {
    return {
      min: convertMoney(minMatch[1], minMatch[2]),
      max: null
    };
  }

  return {
    min: null,
    max: null
  };
}

function detectProductIntent(message) {
  const text = removeVietnameseTones(message);

  const rules = [
    {
      name: 'Nồi chiên',
      categoryIds: [9],
      keywords: ['nồi chiên', 'lò chiên', 'chiên không dầu'],
      check: () => text.includes('noi chien') || text.includes('lo chien') || text.includes('chien khong dau')
    },
    {
      name: 'Nồi cơm',
      categoryIds: [8],
      keywords: ['nồi cơm'],
      check: () => text.includes('noi com')
    },
    {
      name: 'Máy xay sinh tố',
      categoryIds: [22],
      keywords: ['máy xay', 'máy xay sinh tố'],
      check: () => text.includes('may xay') || text.includes('xay sinh to')
    },
    {
      name: 'Bếp từ',
      categoryIds: [3, 4, 5],
      keywords: ['bếp từ', 'bếp hồng ngoại'],
      check: () => text.includes('bep tu') || text.includes('bep hong ngoai')
    },
    {
      name: 'Bếp ga',
      categoryIds: [1, 2, 7, 15],
      keywords: ['bếp ga', 'bếp gas'],
      check: () => text.includes('bep ga') || text.includes('bep gas')
    },
    {
      name: 'Bình đun siêu tốc',
      categoryIds: [21],
      keywords: ['bình đun', 'ấm siêu tốc'],
      check: () => text.includes('binh dun') || text.includes('am sieu toc')
    },
    {
      name: 'Máy ép trái cây',
      categoryIds: [23],
      keywords: ['máy ép', 'máy ép trái cây'],
      check: () => text.includes('may ep')
    },
    {
      name: 'Quạt điều hòa',
      categoryIds: [13],
      keywords: ['quạt điều hòa'],
      check: () => text.includes('quat dieu hoa')
    },
    {
      name: 'Quạt',
      categoryIds: [14],
      keywords: ['quạt'],
      check: () => text.includes('quat')
    },
    {
      name: 'Máy lọc nước',
      categoryIds: [12],
      keywords: ['máy lọc nước'],
      check: () => text.includes('may loc nuoc')
    },
    {
      name: 'Máy lọc không khí',
      categoryIds: [17],
      keywords: ['máy lọc không khí'],
      check: () => text.includes('may loc khong khi')
    },
    {
      name: 'Máy sấy',
      categoryIds: [11],
      keywords: ['máy sấy'],
      check: () => text.includes('may say')
    },
    {
      name: 'Bàn là',
      categoryIds: [24],
      keywords: ['bàn là', 'bàn ủi'],
      check: () => text.includes('ban la') || text.includes('ban ui')
    },
    {
      name: 'Đồ dùng nhà bếp',
      categoryIds: [8, 9, 21, 22, 23],
      keywords: ['đồ dùng nhà bếp'],
      check: () => text.includes('do bep') || text.includes('nha bep') || text.includes('do dung nha bep')
    }
  ];

  const matched = rules.find(rule => rule.check());

  if (matched) {
    return matched;
  }

  const stopWords = [
    'toi', 'tôi', 'muon', 'muốn', 'can', 'cần', 'mua',
    'tu', 'tư', 'van', 'vấn', 'cho', 'hoi', 'hỏi',
    'san', 'sản', 'pham', 'phẩm', 'gia', 'giá',
    'duoi', 'dưới', 'tren', 'trên', 'khoang', 'khoảng',
    'tam', 'tầm', 'loai', 'loại', 'nao', 'nào',
    'anh', 'chị', 'em', 'shop', 'hang', 'hàng',
    'tot', 'tốt', 're', 'rẻ', 'khong', 'không'
  ];

  const keywords = text
    .replace(/[^\p{L}\p{N}\s]/gu, ' ')
    .split(/\s+/)
    .filter(word => word.length >= 2)
    .filter(word => !stopWords.includes(word))
    .slice(0, 5);

  return {
    name: '',
    categoryIds: [],
    keywords
  };
}

function getAdviceByIntent(intentName, message) {
  const text = removeVietnameseTones(message);

  if (intentName === 'Nồi chiên') {
    return 'Khi chọn nồi chiên không dầu, anh/chị nên chú ý dung tích, công suất, khả năng vệ sinh và số người sử dụng trong gia đình.';
  }

  if (intentName === 'Nồi cơm') {
    return 'Khi chọn nồi cơm, anh/chị nên cân nhắc dung tích, công nghệ nấu, lòng nồi và nhu cầu sử dụng hằng ngày.';
  }

  if (intentName === 'Máy xay sinh tố') {
    return 'Khi chọn máy xay sinh tố, anh/chị nên ưu tiên công suất, chất liệu cối, độ dễ vệ sinh và nhu cầu xay thực phẩm.';
  }

  if (intentName.includes('Bếp')) {
    return 'Khi chọn bếp, anh/chị nên quan tâm công suất, độ an toàn, chất liệu mặt bếp và khả năng tiết kiệm năng lượng.';
  }

  if (intentName.includes('Quạt')) {
    return 'Khi chọn quạt, anh/chị nên cân nhắc diện tích phòng, độ ồn, công suất và khả năng tiết kiệm điện.';
  }

  if (intentName.includes('Máy lọc')) {
    return 'Khi chọn máy lọc, anh/chị nên chú ý công suất, diện tích sử dụng, thương hiệu và chi phí thay lõi hoặc bảo trì.';
  }

  if (text.includes('khuyen mai') || text.includes('giam gia') || text.includes('sale')) {
    return 'Các sản phẩm khuyến mãi giúp anh/chị tiết kiệm chi phí hơn, tuy nhiên vẫn nên so sánh nhu cầu sử dụng, giá sau giảm và thông số sản phẩm.';
  }

  return 'Anh/chị có thể chọn sản phẩm theo nhu cầu sử dụng, mức giá phù hợp, thương hiệu, khuyến mãi và thông số kỹ thuật của từng sản phẩm.';
}

app.post('/api/ai-chatbot', async (req, res) => {
  try {
    const { message } = req.body;

    if (!message || message.trim() === '') {
      return res.json({
        reply: 'Anh/chị vui lòng nhập nhu cầu cần tư vấn ạ.',
        products: []
      });
    }

    const text = removeVietnameseTones(message);
    const intent = detectProductIntent(message);
    const priceRange = extractPriceRange(message);

    const isPromotion =
      text.includes('khuyen mai') ||
      text.includes('giam gia') ||
      text.includes('sale') ||
      text.includes('uu dai');

    const isBestSeller =
      text.includes('hot') ||
      text.includes('ban chay') ||
      text.includes('noi bat');

    const isCheap =
      text.includes('gia re') ||
      text.includes('re') ||
      text.includes('tiet kiem');

    const finalPriceExpr = 'ROUND(pv.product_variant_price * (100 - IFNULL(d.discount_amount, 0)) / 100)';

    let where = [
      'p.product_is_display = 1',
      'c.category_is_display = 1',
      'pv.product_variant_is_display = 1',
      'pv.product_variant_available > 0'
    ];

    let params = [];

    if (intent.categoryIds && intent.categoryIds.length > 0) {
      where.push(`p.category_id IN (${intent.categoryIds.map(() => '?').join(',')})`);
      params.push(...intent.categoryIds);
    } else if (intent.keywords && intent.keywords.length > 0) {
      const keywordConditions = [];

      intent.keywords.forEach(keyword => {
        keywordConditions.push(`
          (
            p.product_name LIKE ?
            OR c.category_name LIKE ?
            OR c.categorry_type LIKE ?
          )
        `);

        params.push(
          `%${keyword}%`,
          `%${keyword}%`,
          `%${keyword}%`
        );
      });

      where.push(`(${keywordConditions.join(' OR ')})`);
    }

    if (priceRange.min) {
      where.push(`${finalPriceExpr} >= ?`);
      params.push(priceRange.min);
    }

    if (priceRange.max) {
      where.push(`${finalPriceExpr} <= ?`);
      params.push(priceRange.max);
    }

    if (isPromotion) {
      where.push('IFNULL(d.discount_amount, 0) > 0');
    }

    if (!intent.categoryIds.length && !intent.keywords.length && !isPromotion && !isBestSeller && !isCheap) {
      return res.json({
        reply: 'Dạ anh/chị có thể nhập rõ hơn nhu cầu cần mua không ạ? Ví dụ: “nồi chiên không dầu dưới 2 triệu”, “máy xay sinh tố”, “bếp từ”, “quạt điều hòa”, hoặc “sản phẩm đang khuyến mãi” để em gợi ý chính xác hơn ạ.',
        products: []
      });
    }

    let orderBy = `
      pv.product_variant_is_bestseller DESC,
      IFNULL(d.discount_amount, 0) DESC,
      p.product_rate DESC,
      p.product_view_count DESC
    `;

    if (isCheap || priceRange.max) {
      orderBy = `
        final_price ASC,
        pv.product_variant_is_bestseller DESC,
        IFNULL(d.discount_amount, 0) DESC
      `;
    }

    if (isBestSeller) {
      orderBy = `
        pv.product_variant_is_bestseller DESC,
        p.product_view_count DESC,
        p.product_rate DESC
      `;
    }

    const sql = `
      SELECT 
        p.product_id,
        p.product_name,
        p.product_avt_img,
        p.product_rate,
        p.product_description,
        c.category_id,
        c.category_name,
        c.categorry_type,
        pv.product_variant_id,
        pv.product_variant_name,
        pv.product_variant_price,
        pv.product_variant_available,
        pv.product_variant_is_bestseller,
        IFNULL(d.discount_amount, 0) AS discount_amount,
        ${finalPriceExpr} AS final_price
      FROM products p
      INNER JOIN categories c ON p.category_id = c.category_id
      INNER JOIN product_variants pv ON p.product_id = pv.product_id
      LEFT JOIN discounts d ON pv.discount_id = d.discount_id
      WHERE ${where.join(' AND ')}
      ORDER BY ${orderBy}
      LIMIT 15
    `;

    const rawProducts = await query(sql, params);

    const seen = new Set();

    const products = rawProducts
      .filter(product => {
        if (seen.has(product.product_id)) {
          return false;
        }

        seen.add(product.product_id);
        return true;
      })
      .slice(0, 5)
      .map(product => {
        const shortDescription = stripHtml(product.product_description).substring(0, 110);

        return {
          product_id: product.product_id,
          product_variant_id: product.product_variant_id,
          category_id: product.category_id,
          product_name: String(product.product_name || '').trim(),
          category_name: product.category_name,
          original_price: Number(product.product_variant_price),
          final_price: Number(product.final_price),
          discount_amount: Number(product.discount_amount || 0),
          is_bestseller: Number(product.product_variant_is_bestseller || 0),
          available: Number(product.product_variant_available || 0),
          short_description: shortDescription,
          product_url: `/search/${product.product_variant_id}?category_id=${product.category_id}`,

          // Nếu ảnh sản phẩm không hiện, sửa đường dẫn này theo thư mục ảnh sản phẩm của bạn.
          image_url: `/imgs/products/${product.product_avt_img}`
        };
      });

    let reply = '';

    if (products.length > 0) {
  if (isPromotion) {
    reply = `Dạ hiện em tìm thấy ${products.length} sản phẩm đang có khuyến mãi trên website Toản Hiền:\n\n`;
  } else {
    reply = `Dạ em tìm thấy ${products.length} sản phẩm phù hợp với nhu cầu của anh/chị:\n\n`;
  }

  products.forEach((product, index) => {
    reply += `${index + 1}. ${product.product_name}\n`;
    reply += `Danh mục: ${product.category_name}\n`;

    if (product.discount_amount > 0 && product.final_price < product.original_price) {
      reply += `Giá sau giảm: ${formatMoney(product.final_price)} `;
      reply += `(giảm ${product.discount_amount}%)\n`;
    } else {
      reply += `Giá: ${formatMoney(product.original_price)}\n`;
    }

    reply += `Xem chi tiết: ${product.product_url}\n\n`;
  });

  reply += getAdviceByIntent(intent.name, message);
  reply += '\n\nAnh/chị có thể bấm “Xem chi tiết” để xem đầy đủ thông tin sản phẩm ạ.';
}
    else {
      reply = 'Dạ hiện em chưa tìm thấy sản phẩm phù hợp trong hệ thống. Anh/chị có thể thử nhập từ khóa khác như “nồi chiên”, “máy xay”, “bếp từ”, “quạt”, “máy lọc nước” hoặc thêm tầm giá để em gợi ý chính xác hơn ạ.';
    }

    res.json({
      reply,
      products
    });

  } catch (error) {
    console.error('Lỗi AI chatbot nâng cấp:', error);

    res.status(500).json({
      reply: 'Dạ chatbot đang gặp lỗi khi tìm sản phẩm trong hệ thống, anh/chị vui lòng thử lại sau ạ.',
      products: []
    });
  }
});

// route init
route(app)

app.listen(cfg.port, () => {
    console.log(`Website is running at http://${cfg.host}:${cfg.port}`)
})