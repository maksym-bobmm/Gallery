// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
// $(document).on('mouseenter mouseleave', '.dropdownMenuLink', function(e)
// {
//     let toggler = $(this).find('[data-toggle="dropdown"]').first();
//
//     if(e.type === 'mouseenter') {
//         $(toggler).trigger('click', 'open');
//     } else if ($(this).children('.dropdown-menu.show').length) {
//         $(toggler).trigger('click', 'close');
//     }
// });
$('#heart').bind('ajax:error', function () {
    alert('qwe');
    Console.log(data);
});
$('.ajax a').on ('ajax:error', noo)
function noo(){
    alert('noooo');
    Console.log(data);
}
$(`#image-like_link a`).bind(`ajax:success`, after_like)
function after_unlike(event, data) {
    alert('qwe');
    Console.log(data);
    $(`image-like_link`).replaceWith(
        '<a id="image-like_link" data-remote="true" rel="nofollow" data-method="post" href="/likes">' +
        `<img alt="like" id="heart" src=data.image_path>` +
        '</a>'
    );
}
function after_like(event, data) {
    alert('asd');
    Console.log(data);
    $(`image-like_link`).replaceWith(
        '<a id="image-unlike_link" data-remote="true" rel="nofollow" data-method="delete" href="/likes/">' +
        `<img alt="unlike" id="heart" src=data.image_path>` +
        '</a>'
    );
}