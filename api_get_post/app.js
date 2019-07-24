var express = require("express")
var app = express()
var body = require("body-parser")
app.use(body.urlencoded({ extended: true })); 

app.get('/findme', function(req, res){
	res.send("Its in India")

})

app.get('/index', function(req, res){
	res.sendFile('./index1.html', { root: __dirname });
})

app.post('/getdata', function(req, res) {
	console.log(req.body)
	console.log("value ", req.body.firstname)
	console.log("data recived:", req.body)
})

app.listen(4000)


