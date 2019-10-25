$(document).on('turbolinks:load', function() {
    $(function() {
        $('body').on('ajax:success', '#image-unlike_link', function(event) {
            debugger;
            $('#image-unlike_link').replaceWith(event.detail[0].link_with_image_tags);
            $('#likesCount').text(event.detail[0].likes_count + ' ' + event.detail[0].likes_word);
        });
    });
    $(function() {
        $('body').on('ajax:success', '#image-like_link', function(event) {
            debugger;
            $('#image-like_link').replaceWith(event.detail[0].link_with_image_tags);
            $('#likesCount').text(event.detail[0].likes_count + ' ' + event.detail[0].likes_word);
        });
    });
});
