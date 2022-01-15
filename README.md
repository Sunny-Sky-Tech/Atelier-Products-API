# Atelier-Products-API

Custom API to serve the product overview section to an existing e-commerce client.

## Technologies

- Server: Node, Express
- DBMS: PostgreSQL
- Deployment: AWS 
- Dev Testing: k6
- Production Testing: Loader.io

## Installation

Install [PostgreSQL](https://www.postgresql.org/docs/9.3/tutorial-createdb.html)

```
$ git clone https://github.com/ycfan23/Atelier-Products-API.git
```

Install dependencies with `npm`

```
$ npm install
$ npm start
```

## API Reference

### List Products

> Retrieves the list of products.

`GET /products`

Query Parameters

| Parameter  | Type    | Description                                                                         |
| :--------- | :------ | :---------------------------------------------------------------------------------- |
| page       | integer | Selects the page of results to return. Default 1.                                   |
| count      | integer | Specifies how many results per page to return. Default 5.                           |

Response:
`Status: 200 OK`

---

### Get Product Information

> Returns all product level information for a specified product id.

`GET /products/:product_id`

Query Parameters

| Parameter  | Type    | Description                                                    |
| :--------- | :------ | :------------------------------------------------------------- |
| product_id | integer | `REQUIRED` ID of the product request |

Response:
`Status: 200 OK`

---

### Get Product Styles

> Returns the all styles available for the given product.

`GET /products/:product_id/styles`

Query Parameters

| Parameter  | Type    | Description                                                    |
| :--------- | :------ | :------------------------------------------------------------- |
| product_id | integer | `REQUIRED` ID of the product request |

Response:
`Status: 200 OK`

---

### Get Related Products

> Returns the id's of products related to the product specified.

`GET /products/:product_id/related`

Query Parameters

| Parameter  | Type    | Description                                                    |
| :--------- | :------ | :------------------------------------------------------------- |
| product_id | integer | `REQUIRED` ID of the product request |

Response:
`Status: 200 OK`

---

## Author

[Yachao Fan](https://github.com/ycfan23)
