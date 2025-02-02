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

// Báo lỗi khi chưa đăng nhập
$(document).ready(function () {
    $(".addToCart").on("click", function (event) {
        event.preventDefault();
        showLoginPrompt();
    });

    function showLoginPrompt() {
        alert("Bạn cần đăng nhập để thực hiện thao tác này.");
        window.location.href = "LoginController";
    }
});
