$(document).ready(function () {
    $('.album input').on('click', function () {
        let keyboardImage = $(this).attr('data-image');

        $('.active').removeClass('active');
        $('.left-column img[data-image = ' + keyboardImage + ']').addClass('active');
        $(this).addClass('active');
    })
});