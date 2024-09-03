const express = require('express');
const app = express();
const port = 3000;

app.get('/index.html', (req, res) => {
  res.send('<h1>Index Page</h1>');
});

app.get('/health/check', (req, res) => {
  res.send({ status: 'UP' });
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
