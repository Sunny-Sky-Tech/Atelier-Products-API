-- brew services start postgresql
-- psql postgres -U root
-- brew services stop postgresql
DROP DATABASE IF EXISTS product_overview;

CREATE DATABASE product_overview;

\c product_overview;

DROP TABLE IF EXISTS products, features, styles, skus, photos, related;

CREATE TABLE products (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  slogan TEXT,
  description TEXT,
  category TEXT,
  default_price TEXT
);

COPY products
FROM '/Users/yachao/Desktop/Hack Reactor/Senior Phase/SDC/CSV data/product.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE features (
  id INTEGER NOT NULL PRIMARY KEY,
  product_id INTEGER REFERENCES products(id),
  feature TEXT,
  value TEXT
);

COPY features
FROM '/Users/yachao/Desktop/Hack Reactor/Senior Phase/SDC/CSV data/features.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE styles (
  id INTEGER NOT NULL PRIMARY KEY,
  product_id INTEGER REFERENCES products(id),
  name TEXT,
  original_price TEXT,
  sale_price TEXT,
  default_ BOOLEAN
);

COPY styles
FROM '/Users/yachao/Desktop/Hack Reactor/Senior Phase/SDC/CSV data/styles.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE skus (
  id INTEGER NOT NULL PRIMARY KEY,
  style_id INTEGER REFERENCES styles(id),
  size TEXT,
  quantity INTEGER
);

COPY skus
FROM '/Users/yachao/Desktop/Hack Reactor/Senior Phase/SDC/CSV data/skus.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE photos (
  id INTEGER NOT NULL PRIMARY KEY,
  style_id INTEGER REFERENCES styles(id),
  url TEXT,
  thumbnail_url TEXT
);

COPY photos
FROM '/Users/yachao/Desktop/Hack Reactor/Senior Phase/SDC/CSV data/photos.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE related (
  id INTEGER NOT NULL PRIMARY KEY,
  product_id INTEGER REFERENCES products(id),
  related_product_id INTEGER
);

COPY related
FROM '/Users/yachao/Desktop/Hack Reactor/Senior Phase/SDC/CSV data/related.csv'
DELIMITER ','
CSV HEADER;

CREATE INDEX products_idx ON products (id);
CREATE INDEX features_idx ON features (product_id);
CREATE INDEX styles_idx ON styles (product_id);