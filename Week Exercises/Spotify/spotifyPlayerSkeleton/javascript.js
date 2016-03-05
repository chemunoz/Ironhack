$(document).ready(function(){
  $('.btn-submit').click(function(event){
    event.preventDefault();
    call_Ajax('track');
  })
});

$('.btn-play').click(function(){
    $('.btn-play').toggleClass("disabled");
    $('.btn-play').toggleClass("playing");

    if ($('.btn-play').hasClass('disabled')){
      $('.js-player').trigger('pause');
    }else{
      $('.js-player').trigger('play');
    }
  })

// Have printTime be called when the time is updated
$('.js-player').on('timeupdate', printTime);


function printTime () {
  var current = $('.js-player').prop('currentTime');
  console.debug('Current time: ' + current);
  $('.bar').attr('value', current);
}

function call_Ajax(type){
  var ajax_url="";
  var ajax_type="";
  
  switch(type){
    case 'track':
      ajax_url='https://api.spotify.com/v1/search?type=track&q='+$('.track-search').val();
      ajax_type=showSongs;
      break;
    case 'artist':
      ajax_url=$(event.currentTarget).attr('data-name');
      ajax_type=showArtist;
      break;
  }

  $.ajax({
    type: 'GET',
    url: ajax_url,
    success: ajax_type,
    dataType: 'json'
  });
}

function showSongs(response){
  $('.title').empty();
  $('.author').empty();
  
  if ($('.btn-play').hasClass("playing")){
    $('.btn-play').removeClass("playing");
    $('.js-player').trigger('pause');
  }


  $('.btn-more').removeClass('disabled');

  $('.title').text(response.tracks.items[0].name);
  $.each(response.tracks.items[0].artists, function(key, value){
    $('.author').append("<a href='#' class='artist-link' data-name='"+value.href+"'>"+value.name+"</a> ");
  })
  $('.img-cover').attr('src', response.tracks.items[0].album.images[0].url);
  $('.js-player').attr('src', response.tracks.items[0].preview_url);

  $('.artist-link').click(function(){
    call_Ajax('artist');
  })

  $('.btn-more').click(function(){
    showMoresongs(response);
  })
}


function showMoresongs(response){
  console.log(response);
  $('.modal-body').text("");

  var html="";
  $.each(response.tracks.items, function(key, val){
    var artis="";
    
    $.each(response.tracks.items[key].artists, function(artist_key, artist_val){
      artis=artis + artist_val.name;
    })
    html=["<li data-title='"+artis+" "+val.name
                            +"' class='link-more-songs'><a href='#'>"
                            + artis+ " - "+val.name+"</a></li>"].join("\n");
    $('.modal-body').append(html);  
  });

  $('.modal-body').prepend("<ul>");
  $('.modal-body').append("</ul>");
  $('.modal-body').css("text-align", "left");
  $('.modal-header').html("<h2>MORE RESULTS</h2>");

  $('.link-more-songs').click(function(){
    $(".js-modal").modal("hide");
    $('.track-search').val($(event.currentTarget).attr('data-title'));
    $('.js-player').trigger('play');
    call_Ajax('track');
  })

  $(".js-modal").modal("show");
}


function showArtist(response){
   var genres="";
   
   $('.modal-body').text("");

   $.each(response.genres, function(key, val){
      genres=genres+ val;
    })

  if ((response.images).length){
    var html=[
    "<img class='artist-img' src='"+response.images[0].url+"' width='80%'>"].join("\n");
  }
  else{
    html='<img src="http://diymusician.cdbaby.com/wp-content/uploads/2015/11/spotify_2014_0-1.jpg">';
  }

  $('.modal-body').html(html);
  $('.modal-body').css("text-align", "center");
  $('.modal-header').html("<h2>"+response.name.toUpperCase()+"<br>"
                          +" <small>Genres: "+genres.toUpperCase()
                          +" - Followers: "+response.followers.total
                          +" - Popularity: "+response.popularity+"</small></h2>");
  $(".js-modal").modal("show");
}


