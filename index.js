var mysql = require('mysql');
var express = require('express');
var session = require('express-session');
var bodyParser = require('body-parser');
var path = require('path');
var jwt = require('jsonwebtoken');
var config = require('./config');


//db configuration
var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : 'softinc',
	database : 'nodelogin'
});

var app = express();
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());

app.get('/', function(request, response) {
	response.sendFile(path.join(__dirname + '/views/registration.html'));
});

app.post('/auth', function(request, response) {
	const username = request.body.username;
    const password = request.body.password;
    const email = request.body.email;
    let userJSON = {};
    const currentTime = new Date();
    console.log(currentTime);
	if (username && password) {
        let userCredentials = {
            'userName' : username,
            'email':password
        }
        //Create token
        var token = jwt.sign(userCredentials, config.secret, {
            expiresIn: '2h' // expires in 2 hours
            });
        var records = [
            [username, password ,email,token]
          ];
          connection.query("INSERT INTO accounts (username,password,email,token) VALUES ?", [records], function (err, result, fields) {
            if (err) throw err;
            console.log("Number of records inserted: " + result.affectedRows);
            
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

app.get('/home', function(request, response) {
	if (request.session.loggedin) {
		response.send('Welcome back, ' + request.session.username + '!');
	} else {
		response.send('Please login to view this page!');
	}
	response.end();
});

app.listen(3000);