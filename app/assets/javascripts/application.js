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

//= require jquery.barrating
//= require chosen-jquery
//= require messages



//= require bootstrap-sprockets
//= require jquery.touchSwipe


//= require_tree .

$(document).ready(function(){

  //call side nav
  $(".button-collapse").sideNav();

  //swipe alerts away
  var $alert = $('.alert');
  if($alert.length > 0){
    Materialize.toast($alert, 3000);
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

  //bar project rating
  $(function() {
    function ratingEnable() {
        $('#project_ratings').barrating('show', {
            theme: 'bars-1to10'
        });


        var currentRating = $('#example-fontawesome-o').data('current-rating');

        $('.stars-example-fontawesome-o .current-rating')
            .find('span')
            .html(currentRating);

        $('.stars-example-fontawesome-o .clear-rating').on('click', function(event) {
            event.preventDefault();

            $('#example-fontawesome-o')
                .barrating('clear');
        });

        $('#example-fontawesome-o').barrating({
            theme: 'fontawesome-stars-o',
            showSelectedRating: false,
            initialRating: currentRating,
            onSelect: function(value, text) {
                if (!value) {
                    $('#example-fontawesome-o')
                        .barrating('clear');
                } else {
                    $('.stars-example-fontawesome-o .current-rating')
                        .addClass('hidden');

                    $('.stars-example-fontawesome-o .your-rating')
                        .removeClass('hidden')
                        .find('span')
                        .html(value);
                }
            },
            onClear: function(value, text) {
                $('.stars-example-fontawesome-o')
                    .find('.current-rating')
                    .removeClass('hidden')
                    .end()
                    .find('.your-rating')
                    .addClass('hidden');
            }
        });
    }

    function ratingDisable() {
        $('select').barrating('destroy');
    }

    $('.rating-enable').click(function(event) {
        event.preventDefault();

        ratingEnable();

        $(this).addClass('deactivated');
        $('.rating-disable').removeClass('deactivated');
    });

    $('.rating-disable').click(function(event) {
        event.preventDefault();

        ratingDisable();

        $(this).addClass('deactivated');
        $('.rating-enable').removeClass('deactivated');
    });

    ratingEnable();
});

});
