$( document ).ready(function()
{
      $('.btn-submit').click(
                            function(event){
                              event.preventDefault();
                              show_artists();
                            });


      //ARTISTS
      function show_artists(){

            //Peticion AJAX
            $.ajax({
              type:"GET",
              url: 'https://api.spotify.com/v1/search?type=artist&query='+$('.artist-search').val(),
              success: handleArtist,
              dataType:'json'
            });


            //Success Function
            function handleArtist(art){
              //console.log(art);
              $('.ul-artists').empty();


              $.each(art.artists.items, function(key,val){
                //console.log(val);
                if (val.images.length>0){
                    var img = val.images[1].url;
                  }
                else{
                      var img = 'http://www.elche.me/sites/default/files/styles/marcaagua/public/discocheiwjunior_2red.jpg';
                    }

                var html=[
                "<li class='li-artist' data-value='"+val.id+"'>"+val.name+" ("+val.followers.total+" followers)",
                "<a href='"+val.external_urls.spotify+"' class='link-artist'>LINK</a>",
                "<br><img src='"+img+"' class='img-artist' data-toggle='modal' data-target='#myModal'>",
                "<ul class='ul-albums alb"+val.id+"'></ul></li>",
              /*"<div class='cut'></div>"*/].join("\n");

                $('.ul-artists').append(html);
                show_albums(val.id);
              })
              $('.img-artist').click(getAlbums);
            }

          }

      //MANEJO DEL EVENTO DEL CLICK EN LA IMAGEN
      function getAlbums(event){
        event.preventDefault();
        var id = $(event.currentTarget).parent().attr("data-value");
        show_albums(id);
      }

      //ALBUMS
      function show_albums(id){
        $.ajax({
          type:"GET",
          url: 'https://api.spotify.com/v1/artists/'+id+'/albums',
          success: handleAlbums,
          dataType:'json'
        });

        function handleAlbums(alb){
          $('.modal-body').empty();

          $.each(alb.items, function(key,val){
            var html=[
            "<li class='li-albums' data-value='"+val.id+"'>",//"<a>"+val.name+"</a>",
            "<br><img src='"+val.images[1].url+"' alt='"+val.name+"' class='img-album'>",
            "<br>"+val.name,
            "<ul class='ul-tracks trac"+val.id+"'></ul></li>"].join("\n");

            $('.modal-body').append(html);
            $('#myModalLabel').text('.::ALBUMS::.');
          })

          $('.img-album').click(
                                function(e){
                                  e.preventDefault();
                                  show_tracks();
                                });
        }

      }



      //TRACKS
      function show_tracks(){

        var id=$(event.currentTarget).parent().attr("data-value");
        $.ajax({
          type:"GET",
          url: 'https://api.spotify.com/v1/albums/'+id+'/tracks',
          success: handleTracks,
          dataType:'json'
        });

        function handleTracks(trac){
          $('.modal-body').empty();
          $.each(trac.items, function(key,val){
            var html=[
            "<li class='li-tracks'><a href='"+val.external_urls.spotify+"'>"+val.name+"</a><br>",
            "<audio controls><source src='"+val.preview_url+"'></source></audio></li>"].join("\n");

            $('.modal-body').append(html);

            $('#myModalLabel').text('.::SONGS::.');
          })
        }

      }
});
