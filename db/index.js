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

// pool.connect(
//   (err) => {
//     if (err) {
//       return console.error('Error acquiring client', err)
//     }}
//     console.log('connected to DB');
// )

pool.query('SELECT * FROM features', (err, res) => {
  console.log(err, res)
  pool.end()
})