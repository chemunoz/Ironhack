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

$('#openBtn').click(function(){
  $('#myModal').modal({show:true})
});

// Have printTime be called when the time is updated
$('.js-player').on('timeupdate', printTime);


function printTime () {
  var current = $('.js-player').prop('currentTime');
  console.debug('Current time: ' + current);
  $('.bar').attr('value', current);
}

function call_Ajax(type){
  console.log(type);
  console.log('https://api.spotify.com/v1/search?type=track&q='+$('.track-search').val().replace(" ", "%20"));
  var ajax_url="";
  var ajax_type="";
  
  switch(type){
    case 'track':
      ajax_url='https://api.spotify.com/v1/search?type=track&q='+$('.track-search').val().replace(" ", "%20");
      ajax_type=showSongs;
      break;
    case 'artist':
      ajax_url=$(event.currentTarget).attr('data-name');
      ajax_type=showArtist;
      break;
    case 'albums':
      ajax_url='https://api.spotify.com/v1/artists/'+$('.btn-more-from-artist').attr('data-artist')+'/albums',
      ajax_type=showAlbums;
  }

  $.ajax({
    type: 'GET',
    url: ajax_url,
    success: ajax_type,
    dataType: 'json'
  });
}

function showSongs(response){
  console.log(response);

  if (response.tracks.items.length>0){
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
    $('.img-cover').removeClass('data-img-error');
    $('.img-cover').attr('src', response.tracks.items[0].album.images[0].url);
    $('.js-player').attr('src', response.tracks.items[0].preview_url);

    $('.artist-link').click(function(){
      call_Ajax('artist');
    })

    $('.btn-more').click(function(){
      showMoresongs(response);
    })
  }
  else{
    $('.title').text('no title');
    $('.author').text('no author');
    $('.img-cover').attr('src', 'http://diymusician.cdbaby.com/wp-content/uploads/2015/11/spotify_2014_0-1.jpg');
    $('.img-cover').addClass('data-img-error');
    
  }
}


function showMoresongs(response){
  console.log(response);
  $('.modal-body').text("");

  var html="";
  $.each(response.tracks.items, function(key, val){
    var artis="";
    
    $.each(response.tracks.items[key].artists, function(artist_key, artist_val){
      artis=artis + artist_val.name+" ";
    })
    html=["<li data-title='"+artis+" "+val.name
                            +"' class='link-more-songs'><a href='#'>"
                            + artis+ " - "+val.name+"</a></li>"].join("\n");
    $('.modal-body').append(html);  
  });

  $('.modal-body').prepend("<ul>");
  $('.modal-body').append("</ul>");
  $('.modal-body').css("text-align", "left");
  $('.modal-header').html(
                      "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                      +"<span>&times;</span></button>"
                      +"<h2>MORE RESULTS</h2>");

  $('.link-more-songs').click(function(){
    $(".js-modal").modal("hide");
    $('.track-search').val($(event.currentTarget).attr('data-title'));
    call_Ajax('track');
  })

  $(".js-modal").modal("show");
}


function showArtist(response){
  console.log("showArtists");
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

  $('.modal-header').html("<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                            +"<span>&times;</span></button>"
                            +"<h2>"+response.name.toUpperCase()+"<br>"
                            +" <small>Genres: "+genres
                            +"<br>Followers: "+response.followers.total
                            +" - Popularity: "+response.popularity+"</small></h2>");
  $('.modal-body').html(html);
  $('.modal-body').append("<button class='btn btn-more-from-artist' data-artist='"+response.id+"'>More results from "+response.name+"</button>");
  $('.modal-body').css("text-align", "center");
  
  $('.btn-more-from-artist').click(function(){
    call_Ajax('albums');
  })

  $(".js-modal").modal("show");
}


function showAlbums(response){
  console.log("showAlbums");
  console.log(response);
  $('.body2').empty();
  $.each(response.items, function(key,val){
    var html=[
              "<li class='li-albums' data-value='"+val.id+"'>",//"<a>"+val.name+"</a>",
              "<br><img src='"+val.images[1].url+"' alt='"+val.name+"' class='img-album'>",
              "<br>"+val.name,
              "<ul class='ul-tracks trac"+val.id+"'></ul></li>"].join("\n");

              $('.body2').append('<ul>'+html+'</ul>');
            })
  $('#myModal2').modal({show:true})
}
