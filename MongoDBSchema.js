const mongoose = require('mongoose');

const ProductSchema = mongoose.Schema({
  "product_id": Number,
  "name": String,
  "slogan": String,
  "description": String,
  "category": String,
  "default_price": String,
  "features": [
      {
          "feature": String,
          "value": String
      }
  ]
})

let StyleSchema = mongoose.Schema({
  "product_id": Number,
  "results": [
    {
      "style_id": Integer,
      "name": String,
      "original_price": String,
      "sale_price": String,
      "default?": Boolean,
      "photos": [{
        "thumbnail_url": String,
        "url": String
      }],
      skus: [
        {
          id: Number,
          quantity: Integer,
          size: String
        }
      ]
    }
  ]
})

const RelatedSchema = mongoose.Schema({
  "product_id": Number
})