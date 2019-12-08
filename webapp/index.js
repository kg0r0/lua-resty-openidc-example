const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.status(200).send("welcome!");
});

app.listen(3000, () => {
  console.log('Server running at http://127.0.0.1:3000')
})
