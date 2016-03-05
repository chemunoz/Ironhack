PokemonApp.Pokemon = function(pokemonUri){
  this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
}

PokemonApp.Pokemon.prototype.render = function(){
  console.log("Rendering pokemon: #" + this.id);
  //Metemos THIS en esta variable porque más adentro vamos a tener OTRO THIS
  //para no falle lo metemos en "self" por convención podría llamarse THAT o _THIS
  var self = this;

  $.ajax({
    url: "/api/pokemon/" + this.id,
    success: function(response){
      self.info = response;

      $(".js-pkmn-name").text(self.info.name);
      $(".js-pkmn-number").text(self.info.pkdx_id);
      $(".js-pkmn-height").text(self.info.height);
      $(".js-pkmn-weight").text(self.info.weight);
      $(".js-pkmn-type").empty();
      $.each(self.info.types, function( index, value ) {
        $(".js-pkmn-type").append(self.info.types[index].name+" ");
      })
      $(".js-pkmn-speed").text(self.info.speed);

      $(".js-pkmn-hp").text(self.info.hp);
      $(".js-pkmn-attack-defense").text(self.info.attack.toString() + " / " + self.info.defense.toString());
      $(".js-pkmn-spc-attack-defense").text(self.info.sp_atk.toString() + " / "+ self.info.sp_def.toString());

      // console.log("Self id: "+self.id);
      // PokemonApp.Pokemon.getImage(self.id);
      // PokemonApp.Pokemon.getDescription(self.id);

      var iduri = PokemonApp.Pokemon.idFromUri(self.info.sprites[0].resource_uri);
      PokemonApp.Pokemon.getImage(iduri);
      PokemonApp.Pokemon.getDescription(iduri);


      $('.evolution-button').empty();
      $.each(self.info.evolutions, function(index, value) {
        var html=[
        "<button type='button' class='btn btn-evolution',",
        " data-evolution='"+value.to+"'>"+value.to+"</button> "].join("\n");

        console.log("index:"+index);
        console.log("value:"+value);
        $('.evolution-button').append(html);

        $("[data-evolution='"+value.to+"']").on("click", function(event){
          var pokemon = new PokemonApp.Pokemon(value.resource_uri);
          pokemon.render();
        });
      })

      $(".js-pokemon-modal").modal("show");
    }
  })
}


PokemonApp.Pokemon.getImage = function (id){
  $.ajax({
    url: "/api/sprite/" + id,
    success: function(response){
      var imag = 'http://pokeapi.co'+response.image;
      $('.poke-image').css("background-image", "url("+imag+")");
      }
    })
  }

  PokemonApp.Pokemon.getDescription = function (id){
    console.log('Description: '+id);
    $.ajax({
      url: "/api/description/" + id,
      success: function(response){
        console.log(response);
        $('.js-pkmn-description').text(response.description);
        }
      })
    }

PokemonApp.Pokemon.idFromUri = function (pokemonUri){
  var uriSegments = pokemonUri.split("/");
  var secondLast = uriSegments.length - 2;
  return uriSegments[secondLast];
}

$(document).on("ready", function(){
  $(".js-show-pokemon").on("click", function(event){
    var $button = $(event.currentTarget); //Para identificar qué elemento ha hecho CLICK
    var pokemonUri = $button.data("pokemon-uri");
    var pokemon = new PokemonApp.Pokemon(pokemonUri);
    pokemon.render();
  });
});
