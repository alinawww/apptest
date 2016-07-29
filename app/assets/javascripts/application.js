// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require jquery.touchSwipe

//= require jquery.turbolinks
//= require chosen-jquery
//= require messages

//= require turbolinks
//= require mo.min.js
//= require bootstrap-sprockets

//= require_tree .


$(document).ready(function(){
  //Enable swiping...
  $(".js-extended").swipe( {
    //Generic swipe handler for all directions
    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
      // function goToURL() {
      //   location.href = 'http://google.it';
      //
      // }
      $(this).text("You swiped " + direction );
    },
    //Default is 75px, set to 0 for demo so any distance triggers swipe
     threshold:0
  });

// Show signup form in two steps
  $('.signup-speaker-btn').click(function() {
     if($('#speaker-btn').is(':checked')) {
       $('.second-step').removeClass('hidden')
       $('.first-step').addClass('hidden')
      }
  });
  $('.signup-attendee-btn').click(function() {
     if($('#attendee-btn').is(':checked')) {
       $('.second-step').removeClass('hidden')
       $('.first-step').addClass('hidden')
      }
  });

// style material form
  var materialForm;
  materialForm = function () {
      return $('input').focus(function () {
          return $(this).closest('.field').addClass('focused has-value');
      }).focusout(function () {
          return $(this).closest('.field').removeClass('focused');
      }).blur(function () {
          if (!this.value) {
              $(this).closest('.field').removeClass('has-value');
          }
          return $(this).closest('.field').removeClass('focused');
      });
  };
  $(function () {
      return materialForm();
  });

  //call side nav
  $(".button-collapse").sideNav();

  //swipe alerts away
  var $alert = $('.alert');
  if($alert.length > 0){
    Materialize.toast($alert, 5000);
  }
});
