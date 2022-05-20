var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');

var app = express();
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + '/public'));
const listening_port = 8080;

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});


app.get('/', function(req, res){
	const q = 'select count(*) as count from users;';
	connection.query(q, function(err, response){
		if (err) throw err;
		res.render('home',  {data: response[0].count});
	});
});

app.post('/register', function(req, res){
	const q = `insert into users(email) values ('${req.body.email}');`;
	connection.query(q, function(err, r) {
		if (err) throw err;
		res.redirect('/');
	});
});


app.get('/joke', function(req, res){
	res.send('This is a joke!');
});

app.get('/random', function(req, res){
	res.send(`Your lucky number is ${Math.floor(Math.random() * 10) + 1}`);
});

app.listen(listening_port, function(){
	console.log(`App listening on ${listening_port}`);
});