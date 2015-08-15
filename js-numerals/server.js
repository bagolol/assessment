var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var numToWord = require ('./public/js/numerals.js')

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname));

app.get('/', function (req, res, err) {
    if (err) throw err;
    res.send('index.html');
});

app.post('/number', function (req, res) {
  var data = req.body.quantity;
  data = numToWord.number(data);
  res.send(data);
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('listening at http://%s:%s', host, port);
});