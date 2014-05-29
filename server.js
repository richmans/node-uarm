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
io = io.listen(server);
require('./lib/config/express')(app);
require('./lib/routes')(app);
server.listen(config.port, config.ip, function () {
  console.log('Express server listening on %s:%d, in %s mode', config.ip, config.port, app.get('env'));
});


io.sockets.on('connection', function (socket) {
  socket.emit('servo.1', { value: 100 });  
});

// Expose app
exports = module.exports = app;
