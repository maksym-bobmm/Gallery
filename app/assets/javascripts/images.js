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
$(function() {
    return $('.ajax').on("ajax:success", function(event) {
        debugger
        $(`#image-unlike_link`).replaceWith(event.detail[0].image_path);
        $(`#image-like_link`).replaceWith(event.detail[0].image_path);
    });
});
