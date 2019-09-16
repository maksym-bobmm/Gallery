// $( document).on("turbolinks:load", $('.counting').each(function() {
//     var $this = $(this),
//         countTo = $this.attr('data-count');
//
//     $({ countNum: $this.text()}).animate({
//             countNum: countTo
//         },
//
//         {
//
//             duration: 3000,
//             easing:'linear',
//             step: function() {
//                 $this.text(Math.floor(this.countNum));
//             },
//             complete: function() {
//                 $this.text(this.countNum);
//                 alert('finished');
//             }
//
//         });
// }));
// #counter.counter
//     .bl
//     .number= "#{User.size}"
//     .text= "#{t(:users_count)}"
//     .bl
//     .number= "#{Category.size}"
//     .text= "#{t(:'site.stat.categories'}"
//     .bl
//     .number= "#{Image.size}"
//     .text= "#{t(:'site.stat.likes'}"
//     .bl
//     .number= "#{Comment.size}"
//     .text= "#{t(:'site.stat.comments')}"
// $(document).on('turbolinks:load', function() {
//     var cc = 1;
//     $(window).scroll(function () {
//         $('#counter').each(function(){
//             var cPos = $(this).offset().top,
//                 topWindow = $(window).scrollTop();
//             if (cPos < topWindow + 150) {
//                 if (cc < 2) {
//                     $('.number').addClass('viz');
//                     $('.number').each(function() {
//                         $(this).prop('Counter',0).animate({
//                             Counter:$(this).text()
//                         },{
//                             duration: 4000,
//                             easing: 'swing',
//                             step:function(now) {
//                                 $(this).text(Math.ceil(now));
//                             }
//                         });
//                     });
//                     cc = cc + 1;
//                 };
//             };
//         });
//     });
// });