// app.js

const express = require('express');
const app = express();
const port = 3000;

// EJS テンプレートエンジンの設定
const ejs = require('ejs');
app.set('view engine', 'ejs');

// ミドルウェアの設定
app.use(express.urlencoded({ extended: true }));

// ルートの設定
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.post('/submit', (req, res) => {
  const inputText = req.body.inputText;
  console.log('入力された文字列:', inputText);

  // 提出後に EJS テンプレートをレンダリング
  res.render('index', { submitted: true, submittedText: inputText });
});

// サーバーの起動
app.listen(port, () => {
  console.log(`Server is listening at http://localhost:${port}`);
});
