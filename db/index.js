const config = require('./config.js');
const { Pool, Client } = require('pg');

//connecting to the database
const pool = new Pool({
  user: config.user,
  password: config.password,
  host: config.host,
  port: config.port,
  database: config.database
})

const getProducts = (params) => {
  const query = {
    name: 'products',
    text: `
    SELECT * FROM products
    ORDER BY id
    OFFSET $1 ROW
    FETCH NEXT $2 ROWS ONLY`,
    values: params
  };

  return pool.query(query);
};


module.exports = {
  pool,
  getProducts
};