const http= require('http'),//creacion del servidor http
		path= require('path'),//resolver direcciones y rutas de archivos estaticos
		express= require('express'),//para crear la aplicacion sobre el servidor http, definicion de rutas en el lado del servidor
		Routing= require('./rutas.js'),//utilice las rutas ya creadas en rutas.js
		bodyParser= require('body-parser'),//para intepretar diferentes tipos de datos que viajan en el cuerpo de las peticiones(json)
		mongoose= require('mongoose');

//definimos el puerto y la aplicacion express
const PORT=8082;
const app= express();

//creamos el servidor a partir del modulo http
const Server= http.createServer(app);

mongoose.connect("mongodb://localhost/agendaBD");

//se le dira a la aplicacion express que utilice el modulo body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));


//sirva los archivos estaticos
//app.use(express.static(__dirname + '/client'));
app.use(express.static('../client'));
app.use('/users', Routing);

//ejecutamos la funcion listen sobre el servidor enviando el puerto de callback como argumento
Server.listen(PORT, function(){
	console.log("Se establecio conexion con el servidor en el puerto: " +PORT);
});