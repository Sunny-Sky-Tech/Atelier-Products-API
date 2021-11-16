DROP TABLE IF EXISTS products, features, styles, skus, photos, related;

CREATE TABLE products (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50),
  slogan VARCHAR(125),
  description VARCHAR(500),
  category VARCHAR(50),
  default_price VARCHAR(10)
);

CREATE TABLE features (
  id INTEGER NOT NULL PRIMARY KEY,
  product_id INTEGER,
  feature VARCHAR(80),
  value VARCHAR(255)
);

CREATE TABLE styles (
  id INTEGER NOT NULL PRIMARY KEY,
  product_id INTEGER NOT NULL,
  name VARCHAR(100),
  original_price VARCHAR(15),
  sale_price VARCHAR(15),
  default BOOLEAN
);

CREATE TABLE skus (
  id INTEGER NOT NULL PRIMARY KEY,
  style_id INTEGER,
  size VARCHAR(10),
  quantity INTEGER
);

CREATE TABLE photos (
  id INTEGER NOT NULL PRIMARY KEY,
  style_id INTEGER,
  url VARCHAR(600),
  thumbnail_url VARCHAR(600)
);

CREATE TABLE related (
  id INTEGER NOT NULL PRIMARY KEY,
  current_product_id INTEGER,
  related_product_id INTEGER
);