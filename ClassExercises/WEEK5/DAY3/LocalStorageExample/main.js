$( document ).ready(function()
{
  changeColor(localStorage.getItem('user-color'));
})

$('.color-changer').click(
                      function(e){
                        e.preventDefault();
                        changeColor($(this).attr("data-color"))
                      });

function changeColor(color){
  $('body').css("background-color",color);
  localStorage.setItem('user-color', color);
}
