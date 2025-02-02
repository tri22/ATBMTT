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

// Chọn category
$(document).ready(function () {
    $('.category-link, .category-all').click(function (event) {

        // Remove 'category-all' class from all links
        $('.category-link, .category-all').removeClass('category-all');

        // Add 'category-all' class to the clicked link
        $(this).addClass('category-all');
    });
});