//     $(function() {
//         return $("a[data-remote]").on("ajax:success", function(event) {
//             var myvar, state;
//             myvar = document.getElementById('heart').src;
//             state = 'unliked';
//             if ((myvar.includes(state))(alert('false'))) {
//
//             } else {
//                 return alert('true');
//             }
//         });
//     })
// $(function() {
//     // $.ajax({
//     //     url: "/images/1",
//     //     type: "delete",
//     //     success: function (data, textStatus, jqXHR) {
//     //         alert(textStatus);
//     //     },
//     //     error: function (jqXHR, textStatus, errorThrown) {
//     //     }
//     // });
//     alert(#{@path_to_img})
// });
// $(document).ajax.onreadystatechange(function () {
//     alert('asd');
// });

// $("a[data-remote]").on ( "ajax:success", function () {
//     debugger;
//     alert('alert');
//     Console.log(data);
// } );
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
// $(function() {
//     $('body').on('ajax:error', 'ajax', function(event) {
//         alert('AAAA')
//     });
// });
// $(document).on('turbolinks:load', function (){ alert("turbolinks on load event works") });
