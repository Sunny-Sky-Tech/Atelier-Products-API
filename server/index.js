const express = require("express");
const app = express();
const port = 3000;
const db = require('../db/index');

app.use(express.json());

app.get('/products', (req, res) => {
  const {page = 1, count = 5} = req.query;

  db.getProducts([count, page])
    .then(result => (result.rows))
    .then(result => (res.json(result)))
    .catch(error => {
      console.log('Product list', error);
      res.status(500).send();
    })
})

app.listen(port, () => {
  console.log(`app listening on port ${port}`)
})
