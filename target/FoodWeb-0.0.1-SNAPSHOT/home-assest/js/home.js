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

//Chuyển slider
let currentSlide = 1;
function showSlide(slideNumber) {
    // Ẩn tất cả các slider
    $('.slider').hide();

    // Hiển thị slider được chỉ định
    $('#slider' + slideNumber).show();

    currentSlide = slideNumber;
}
function nextSlide() {
    currentSlide = (currentSlide % 2) + 1; // Chuyển đổi giữa slider 1 và 2
    showSlide(currentSlide);
}
setInterval(nextSlide, 1500);
showSlide(currentSlide);

// HOME COUNTDOWN LOCK
function makeTimer() {

    var endTime = new Date("30 December 2023 9:56:00 GMT+01:00");
    endTime = (Date.parse(endTime) / 1000);

    var now = new Date();
    now = (Date.parse(now) / 1000);

    var timeLeft = endTime - now;

    var days = Math.floor(timeLeft / 86400);
    var hours = Math.floor((timeLeft - (days * 86400)) / 3600);
    var minutes = Math.floor((timeLeft - (days * 86400) - (hours * 3600)) / 60);
    var seconds = Math.floor((timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60)));

    if (hours < "10") { hours = "0" + hours; }
    if (minutes < "10") { minutes = "0" + minutes; }
    if (seconds < "10") { seconds = "0" + seconds; }

    $("#days").html(days + "<span>Days</span>");
    $("#hours").html(hours + "<span>Hours</span>");
    $("#minutes").html(minutes + "<span>Minutes</span>");
    $("#seconds").html(seconds + "<span>Seconds</span>");
}

$(document).ready(function() {
    makeTimer(); // Gọi hàm một lần khi trang được tải
    setInterval(makeTimer, 1000); // Gọi hàm mỗi giây
});