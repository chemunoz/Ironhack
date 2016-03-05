
// NAMED FUNCTION
function sleep (time, fn)
{
  setTimeout(function (){fn(time)}, time*1000)
}


//AQUI LA FUNCION LA DEFINIMOS EN EL PARAMETRO
console.log ('Started!!')
sleep(5, function (time)
          {
            console.log('It was '+ time + ' seconds');
          }
    );
console.log ('This is executed before the callback');

//AQUI LA FUNCION LA DEFINIMOS ANTES!! Y DESPUES LA PASAMOS
var callback = function(time){console.log('its was '+time);}
sleep(2,callback);
//NOTESE que no ponemos paréntesis tras 'callback'
