$(document).ready(function() {
  setTimeout(function() {
    $('.notice-wrapper, .alert-wrapper').fadeOut("slow", function() {
      $(this).remove
    })
  }, 3000);
});
