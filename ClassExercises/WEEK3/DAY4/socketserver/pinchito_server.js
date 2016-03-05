var simplecached = require('simplecached');
var server = new simplecached.Server();
var port = 1702;

var server = simplecached.Server(port, function(error, result) {
  console.log('Server started');
});

//server.close();
