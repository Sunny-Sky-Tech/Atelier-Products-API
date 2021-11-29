const express = require('express')
const bodyParser = require('body-parser')
const db = require('../db/index')

const app = express()
const port = 3000

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.get('/', (req, res) => {
  res.send('hello world!');
})

// get all products
app.get('/products', db.getProducts);

// get product information
app.get('/products/:id', db.getProductInfo);

// get product styles
app.get('/products/:id/styles', db.getProductStyles);

app.listen(port, () => {
  console.log(`app listening on port ${port}`)
})
