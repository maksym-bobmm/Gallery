img = document.getElementsByClassName('resizable');
for(var i=0; img.length; i++){
    if(img[i].width() > img[i].height()) {
        img[i].css('height','15em');
        img[i].css('width', 'auto')
    } else {
        img[i].css('height','auto');
        img[i].css('width','15em');
    }
}
$(document).on('turbolinks:load', function() {
    $(function() {
        $('body').on('ajax:success', '#category-subscribe', function(event) {
            $('#category-subscribe').replaceWith(event.detail[0].subscriptions_link);
        });
    });
    $(function() {
        $('body').on('ajax:success', '#category-unsubscribe', function(event) {
            $('#category-unsubscribe').replaceWith(event.detail[0].subscriptions_link);
        });
    });
});