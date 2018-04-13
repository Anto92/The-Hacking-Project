$( document ).ready(function() {
  $('#sign-up-next').click(function(){
    $('#form_part1').removeClass('form-active');
    $('#form_part1').addClass('form-unactive');
    $('#form_part2').removeClass('form-unactive');
    $('#form_part2').addClass('form-active');
  });
})
