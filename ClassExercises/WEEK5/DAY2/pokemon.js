$( document ).ready(function() {
  $('.btn-submit').click(
                        function(e){
                          e.preventDefault();
                          show_pokemon();
                        });

    function show_pokemon(){

        $.ajax({
          type:"GET",
          url: 'http://pokeapi.co/api/v2/pokemon/'+$('.id-pokemon').val(),
          success: handlePokemon,
          dataType:'json'
        });

        function handlePokemon(poke){
          $('.characteristics').empty();
          $('.title').text(poke.name);

          $.each(poke, function(key,val){
            if (typeof(val)!== "object"){
              $('.characteristics').append('<li>' + key + ': '+ val+'</li>');
          }
          })
        }
      }

});
