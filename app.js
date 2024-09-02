// Arquivo: app.js

const express = require('express');
const app = express();
const port = 3000;

app.get('/index.html', (req, res) => {
  res.send('<h1>Welcome to the Home Page!</h1>');
});

app.get('/health/check', (req, res) => {
  res.status(200).json({ status: 'UP' });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
