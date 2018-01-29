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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on("turbolinks:load", function() {

  // For toggling new tweet submit button and calculating word count
  const MAX_WORD_COUNT = 140;

  $('.new-tweet-form .btn').attr('disabled', true);
  $('.new-tweet-form textarea').on('input change', function() {

    $('.word-count').text(MAX_WORD_COUNT - $(this).val().length);

    if($(this).val().length == 0) {
      $('.new-tweet-form .btn').attr('disabled', true);
    } else {
      $('.new-tweet-form .btn').attr('disabled', false);
    }
    return ($('.word-count').innerHTML && $('.characters').innerHTML)
  });


  // Link avatar to filestack btn
  $('.card-header.profile').click(function() {
    $('.filestack-btn').click();
  });

  // Hide flash banner
  // setTimeout(function() {
  //   $('.flash-banner p').animate({
  //     height: "toggle"
  //   }, 1000);
  // }, 3000);

});
// ================================== End of on turbolinks:load Javascripts ================================================

function updateAvatar(data) {
  var params = {"avatar": data.filesUploaded[0].url };
  $.ajax({
    url: '/update_avatar',
    method: 'PUT',
    data: params
  });
}

// Auto AJAX loading of more tweets
var readyToLoad = true;

var resetLoadStatus = function() {
  setTimeout(function() {
    readyToLoad = true;
    // console.log(`Ready to load(reset): ${readyToLoad}`);
  }, 500);
};
