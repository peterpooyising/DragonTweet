$(document).on("turbolinks:load", function() {
  setTimeout(function() {
    $('.notice-wrapper, .alert-wrapper').fadeOut("slow", function() {
      $(this).remove
    })
  }, 3000);
});



// ============================================= Note =======================================================================
// Rmb to use
//    $(document).on("turbolinks:load", function() {
// and not
//    $(document).ready(function() {
// or else the notication will not fade out the SECOND TIME.
