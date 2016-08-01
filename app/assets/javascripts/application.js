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

//= require jquery.turbolinks
//= require chosen-jquery
//= require messages

//= require turbolinks
//= require mo.min.js
//= require bootstrap-sprockets
//= require jquery.touchSwipe


//= require_tree .

$(document).ready(function(){
  //Enable swiping...
  // $(".js-extended").swipe( {
  //   //Generic swipe handler for all directions
  //   swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
  //     // function goToURL() {
  //     //   location.href = 'http://google.it';
  //     //
  //     // }
  //     $(this).text("You swiped " + direction );
  //   },
  //   //Default is 75px, set to 0 for demo so any distance triggers swipe
  //    threshold:0
  // });

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


  //call side nav
  $(".button-collapse").sideNav();

  //swipe alerts away
  var $alert = $('.alert');
  if($alert.length > 0){
    Materialize.toast($alert, 5000);
  }

  //preview new avatar
  $('.upload_pic').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      // $('#target').html(img);
      $('#target').attr("style", "background:url("+img.src+") center; background-size:cover");
      // $('#target').attr("background", "http://placehold.it/200x200");
    }
    reader.readAsDataURL(image);
    console.log(files);
  });

  $(window).scroll(function() {
    var scroll = $(window).scrollTop();

    if (scroll >= 10) {
        $(".navbar").addClass("stuck");
    } else {
        $(".navbar").removeClass("stuck");
    }
  });
  $( '.event' ).dblclick(function() {
    $('.js-summary').toggleClass('hidden')
  });

});
