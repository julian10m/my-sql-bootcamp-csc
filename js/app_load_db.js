const { faker } = require('@faker-js/faker');


var mysql = require('mysql');
 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});

var q = 'select * from users;'
// var q = 'insert into users(email) values ("jmdf@hotmail.com")';
connection.query(q, function(e, r, f){
	if(e) throw e;
	console.log(r);
});

// var person = {
// 	email: faker.internet.email(),
// 	created_at: faker.date.past()
// };
// var query_sql = connection.query('insert into users set?', person, function(e, r, f){
// 	if(e) throw e;
// 	console.log(r);
// });

data = []
for(let i = 0; i < 500; i++){
	data.push([
		faker.internet.email(),
		faker.date.past()
	]);
}
console.log(data);

var q = 'insert into users(email, created_at) values ?';
connection.query(q, [data], function(e, r){
	if(e) throw e;
	console.log(r);
});

connection.end();
	