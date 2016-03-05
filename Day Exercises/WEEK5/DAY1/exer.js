var phrases = [
  'I like pizza.',
  'Its up to you how far you go. If you dont try, youll never know!',
  'Most people would sooner die than think; in fact, they do so.',
  'I did not attend his funeral, but I wrote a nice letter saying I approved of it.',
  'The graveyards are full of indispensable men.',
  'I am become death, shatterer of worlds.'
];


//EVENTOS A LA HORA DE LA CARGA
$('.btn-submit').click(
                      function(e){
                        e.preventDefault();
                        phrases.push($('.user-phrase').val());
                        $('.user-phrase').val('');
                        show_phrases_array();
                      });
$('.btn-show').click(show_phrase);
$(document).on(show_phrase());
$('.hide').click(function(){$('.phrases-ul').hide()});
$('.show').click(function(){$('.phrases-ul').show()});
$('.phrases-ul').on('click', 'li', function(){
  // console.log('askdbak');
  $(this).hide();
});


function show_phrase(){
  $('#phrase').text(phrases[Math.floor(Math.random() * phrases.length)]);
  show_phrases_array();
}

function show_phrases_array(){
  $('.phrases-ul').empty();

  $.each(phrases, function(i,val){
    $('.phrases-ul').append('<li>' + val + " - <a href='#' name='"+i+"' class='delete'>Delete</a></li>");
  })
}
