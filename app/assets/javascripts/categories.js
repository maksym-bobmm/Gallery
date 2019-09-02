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
