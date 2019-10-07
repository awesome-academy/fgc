'use strict';

$(window).on('load', function() {
  $(".loader").fadeOut();
  $("#preloder").delay(400).fadeOut("slow");
});

$(document).on("turbolinks:load", function() {
  $('.hero-slider').owlCarousel({
    loop: true,
    nav: true,
    dots: true,
    navText: ['', '<img src="assets/icons/solid-right-arrow.png">'],
    mouseDrag: true,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    items: 1,
    autoplayTimeout: 10000,
  });
});

$(document).on("turbolinks:before-cache", function() {
  $('.hero-slider').owlCarousel('destroy');
});

$(function() {
  $('.primary-menu').slicknav({
    appendTo:'.header-warp',
    closedSymbol: '<i class="fa fa-angle-down"></i>',
    openedSymbol: '<i class="fa fa-angle-up"></i>'
  });

  $('.set-bg').each(function() {
    var bg = $(this).data('setbg');
    $(this).css('background-image', 'url(' + bg + ')');
  });

  var dot = $('.hero-slider .owl-dot');
  dot.each(function() {
    var index = $(this).index() + 1;
    if(index < 10){
      $(this).html('0').append(index + '.');
    }else{
      $(this).html(index + '.');
    }
  });

  $('.video-popup').magnificPopup({
    type: 'iframe'
  });

  $('#stickySidebar').stickySidebar({
    topSpacing: 60,
    bottomSpacing: 60
  });
});
