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
        request.session.token = token;
        var records = [
            [username, password ,email,token]
          ];
          
          connection.query("INSERT INTO accounts (username,password,email,token) VALUES ?", [records], function (err, result, fields) {
            if (err) throw err;
            console.log("Number of records inserted: " + result.affectedRows);
            userJSON["status"] = 'true';
            userJSON["message"]= "Registration completed successfully";
            userCredentials['token'] = token;
            userJSON['data'] = userCredentials;
            response.send(userJSON);
            response.end();
		});
	} else {
		response.send('Please enter valid Username and Password!');
		response.end();
	}
});

app.get('/edit', function(request, response) {
   var activeToken = request.session.token;
    console.log(request.session);
    jwt.verify(activeToken,config.secret,function(error,decode){
        if(error){
            console.log(error);
        }else{
            console.log(decode);
            if (decode['username'] && decode['email']) {
                connection.query('SELECT * FROM accounts WHERE username = ? AND email = ?', [decode['userName'], decode['email']], function(error, results, fields) {
                    if (results.length > 0) {
                        request.session.loggedin = true;
                        request.session.username = username;
                        jwt.verify(token,config.secret,function(error,decode){
                            if(error){
                                console.log(error);
                            }else{
                                console.log(decode);
                            }
                        })
                        request.session.token = token;
                        userJSON['status'] = true;
                        userJSON['message'] = "Profile updated";
                        userJSON['data'] = decode;
                        userJSON['data']['token'] = token;
                        response.send(userJSON);
                    } else {
                        response.send("No result");
                    }			
                    response.end();
                });
            } else {
                response.send('NOT  VALID USER!');
                response.end();
            }
        }
    })
	
});


app.listen(3000);