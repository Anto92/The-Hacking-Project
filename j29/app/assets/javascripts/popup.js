setTimeout(function() { alertify.prompt("Inscription Newsletter The Hacking Project", "Ton email", "you@example.com",
  function(evt, value ){
    alertify.success('A bientôt ' + value);
  },
  function(){
    alertify.error('On espere te revoir bientôt quand même');
  })
  ; }, 7000);

// alertify
//   .alert("This is an alert dialog.", function(){
//     alertify.message('OK');
//   });



