function solve_cipher(input, shift)
{
  var array=input.split("");
  var frase="";
  var letter="";

  array.forEach(function(item)
  {
      if (item.charCodeAt(0)===32)
      {
        letter=32;
      }
      else
      {
        item=item.charCodeAt(0)+parseInt(shift);
        
        switch(item)
        {
          case 96:
            letter=122;
            break;
          case 64:
            letter=90;
            break;
          default:
            letter=item;
        }
        frase+=String.fromCharCode(letter);
      }
  });
  return frase;
}

console.log(solve_cipher("p| uhdo qdph lv grqdog gxfn", -3));