function averageColon(numbers_string)
{
  var array=numbers_string.split(":");
  var result=array.reduce(function(a,b, index){
    return parseInt(a)+parseInt(b);
  }, 0);
  return result/array.length;
}


var numbers='80:70:90:100';
console.log(averageColon(numbers));