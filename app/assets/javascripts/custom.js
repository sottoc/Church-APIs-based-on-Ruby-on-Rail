
$(function() {

  ///
  ///       Smooth Scrolling
  ///

  $('a[href*=\\#]:not([href=\\#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      var scrollToPosition = $(target).offset().top - 75;
      if (target.length) {
        $('html,body').animate({
          scrollTop: scrollToPosition
        }, 1000);
        return false;
      }
    }
  });

  ///
  ///     CSS Animation
  ///

  function onScrollInit( items, trigger ) {
    items.each( function() {
      var osElement = $(this),
      osAnimationClass = osElement.attr('data-os-animation'),
      osAnimationDelay = osElement.attr('data-os-animation-delay');

      osElement.css({
        '-webkit-animation-delay':  osAnimationDelay,
        '-moz-animation-delay':     osAnimationDelay,
        'animation-delay':          osAnimationDelay
      });

      var osTrigger = ( trigger ) ? trigger : osElement;

      osTrigger.waypoint(function() {
        osElement.addClass('animated').addClass(osAnimationClass);
      },{
        triggerOnce: true,
        offset: '90%'
      });
    });
  }

  onScrollInit( $('.os-animation') );
  onScrollInit( $('.staggered-animation'), $('.staggered-animation-container') );

  ///
  ///     Mobile Menu
  ///

  $('.js-menuToggle').click(function(event){
    event.preventDefault();
    // create menu variables
    var body    = $('body'),
    page    = $('#page'),
    menu    = $('.js-navbar-menu'),
    navbar  = $('.js-navbar');

    /* Cross browser support for CSS "transition end" event */
    transitionEnd = 'transitionend webkitTransitionEnd otransitionend MSTransitionEnd';

    /* When the toggle menu link is clicked, animation starts */
    body.addClass( 'animating' );

    /*
    * Determine the direction of the animation and
    * add the correct direction class depending
    * on whether the menu was already visible.
    */
    if ( body.hasClass( 'menu-visible' ) ) {
      body.addClass( 'right' );
      navbar.removeClass('force-background');
    } else {
      body.addClass( 'left' );
      navbar.addClass('force-background');
    }

    /*
    * When the animation (technically a CSS transition)
    * has finished, remove all animating classes and
    * either add or remove the "menu-visible" class
    * depending whether it was visible or not previously.
    */
    page.on( transitionEnd, function() {
      body
      .removeClass( 'animating left right' )
      .toggleClass( 'menu-visible' );

      page.off( transitionEnd );
    } );

  });

  /* Modal Alert Box */
  $(function() {
    $('.alert-box').fadeIn("fast", function() {
      $(this).delay(1200).fadeOut("slow");
    });
  });
$(document).on('click','.pending', {} ,function(e){
    $("#not_approved_list").slideToggle('slow');
  });

  /* Slide in Dashboard */
  $(function() {
    $('#open-dashboard').click(function() {
      $('.dashboard-panel').addClass('is-visible');
    });
    $('#close-dashboard').click(function() {
      $('.dashboard-panel').removeClass('is-visible');
    });

  });

/* Hiding and showing options as needed in recurring events */

  $("#event_repeat").click(function(){
    $(".frequency").toggle();
    $(".recurring").hide();
  });

  $('input[type="radio"]').click(function(){
      if($(this).attr("value")=="Daily"){
          $(".recurring").not(".limit").hide();
          $(".limit").show();
      }
      if($(this).attr("value")=="Weekly"){
          $(".recurring").not(".repeat_day").hide();
          $(".repeat_day").show();
          $(".limit").show();
      }
      if($(this).attr("value")=="Monthly"){
          $(".recurring").not(".repeat_date").hide();
          $(".repeat_date").show();
          $(".repeat_day").show();
          $(".repeat_week").show();
          $(".limit").show();
      }
  });

  $('input[type="checkbox"]').click(function(){
      if($(this).attr("name")=="event[repeat_date]"){
          $(".repeat_day").toggle();
          $(".repeat_week").toggle();
          $(".limit").show();
      }
  });



});
