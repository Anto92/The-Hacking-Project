$(document).ready(function() {
    $(".my-profile .picture-self").click(function(){
        console.log("Click sur picture-self !");

        $(this).removeClass('ahead');
        $(this).addClass('behind');

        $(".my-profile .my-bio").removeClass('behind');
        $(".my-profile .my-bio").addClass('ahead');
    });
    $(".my-profile .my-bio").click(function(){
        console.log("Click sur bio 1!");

        $(this).removeClass('ahead');
        $(this).addClass('behind');

        $(".my-profile .picture-self").removeClass('behind');
        $(".my-profile .picture-self").addClass('ahead');
    });
});
