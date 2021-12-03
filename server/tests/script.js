import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  stages: [
    { duration: '15s', target: 200 },
    { duration: '30s', target: 500 },
    { duration: '15s', target: 0 },
  ],
};

export default () => {
  const domain = 'http://localhost:3000/products';

  const id = Math.floor(Math.random() + 100000 + 900000);

  const products = http.get(domain);
  check(products, {
    'Products Status 200': (response) => response.status === 200,
  });
  sleep(1);

  const features = http.get(`${domain}/${id}`);
  check(features, {
    'Features Status 200': (response) => response.status === 200,
  });
  sleep(1);

  const styles = http.get(`${domain}/${id}`);
  check(styles, {
    'Styles Status 200': (response) => response.status === 200,
  });
  sleep(1);

};