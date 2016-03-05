function myfuncion(array)
{
  for (var i = 0; i < array.length; i++) 
  {
    for (var k=0; k<array.length;k++)
    {
      if ((i!=k) && (array[i]+array[k]==0))
      {
        console.log(i)
        console.log(k)

        // result.concat('(' + i + ',' + k + ')')
      }
    }
  }
}




var exampleArray = [2, -5, 10, 5, 4, -10, 0]

//CON FORs ANIDADOS
//myfuncion(exampleArray)


//CON REDUCE
// var result=exampleArray.reduce(function(result, x, i)
//   { 
//     return exampleArray.reduce(function(aux, y, j)
//       {
//         return x + y ===0 ? aux.concat('(' + i + ',' + j + ')') : aux
//       }, result)
//   }, []
// )

console.log(result)