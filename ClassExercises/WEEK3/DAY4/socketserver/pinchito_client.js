var simplecached = require('simplecached');
var client = new simplecached.Client();


var options = {
  port: 1702, //11312,
  host: '192.168.1.15'
};


var client = new simplecached.Client(options, function(error) {
  console.log('Connected');

  var key = 'CHE';
  var value = 'Molo mogollon';

  client.set(key,value, function(error, result) {
    if (error) console.log('Error setting the key');
    if (result) console.log('key setted');
    if (!error) console.log('OK?');
  });


  client.get(key, function(error, value) {
    console.log('OK?', value);
    client.close();
  });

});

//SET KEY (callback=true-si almacena, o false-si no)
