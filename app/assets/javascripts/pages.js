$(document).on('page:change',function() {
 $('a[href="#team"]').click(function (e) {
  e.preventDefault()
  $('#team').css({opacity:0})
  $(this).tab('show');
  window.dispatchEvent(new Event('resize'));
  $('#team').css({opacity:1})
})
$('a[href="#individual"]').click(function (e) {
  e.preventDefault()
  $('#individual').css({opacity:0})
  $(this).tab('show');
   window.dispatchEvent(new Event('resize'));
  $('#individual').css({opacity:1})
}) 
});