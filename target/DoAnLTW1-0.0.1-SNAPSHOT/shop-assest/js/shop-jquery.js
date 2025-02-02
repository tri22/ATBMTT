// Điều chỉnh phần header 2 
$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $('#header2').addClass('sticky');
        } else {
            $('#header2').removeClass('sticky');
        }

        if ($(this).scrollTop() > 400) {
            $('#header2.sticky').addClass('visible');
        } else {
            $('#header2.sticky').removeClass('visible');
        }
    });

    $('.btn').click(function () {
        $('.list-display-none').slideToggle('slow');
    });
});



