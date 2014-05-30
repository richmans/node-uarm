'use strict';

var express = require('express');
var io = require('socket.io');


/**
 * Main application file
 */

// Set default node environment to development
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

var config = require('./lib/config/config');

// Setup Express
var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app);
io = io.listen(server, {log: false});
require('./lib/config/express')(app);
require('./lib/routes')(app);
server.listen(config.port, config.ip, function () {
  console.log('Express server listening on %s:%d, in %s mode', config.ip, config.port, app.get('env'));
});

io.on('connection', function(socket){
  socket.on('servo.command', function(msg){
    console.log('message: ' + msg);
  });
});

// Expose app
exports = module.exports = app;

var arduino = require('duino');
var board = new arduino.Board();

var sensors = ['A0','A1','A2','A3','A4','A5'];

board.on('ready', function(){
	for (var i in sensors) {
		(function(i) {
			var sensor_name = sensors[i];
			var sensor_index = i;
			var sensor = new arduino.Sensor({
			  board: board,
			  pin: sensor_name
			});
			
			sensor.on('read', function(err, value) {
				io.sockets.emit('servo.' + (+sensor_index+1), value);
			});
		})(i);
	}
});
process.on('uncaughtException', function(err) {
	console.error(err);
	//process.exit(1);
});

