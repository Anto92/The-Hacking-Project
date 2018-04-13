/* On attend que la page soit prête */
$( document ).ready(function() {

	/* On surveille les cliques sur les liens du menu */
	$('.tab-nav .btn-matchmaker').click(function(e){
    $('.btn-selected').removeClass('tab-nav-active')
    $('#as-selected').removeClass('tab-active');
    $('.btn-matchmaker').addClass('tab-nav-active')
    $('#as-matchmaker').addClass('tab-active');
  });

  $('.tab-nav .btn-selected').click(function(e){
    $('.btn-matchmaker').removeClass('tab-nav-active')
    $('#as-matchmaker').removeClass('tab-active');
    $('.btn-selected').addClass('tab-nav-active')
    $('#as-selected').addClass('tab-active');
  })
});
