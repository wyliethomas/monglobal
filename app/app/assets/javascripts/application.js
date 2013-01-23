// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .



(function( $ ){

  $.fn.langmenu = function( options ) {  

    var settings = $.extend( {
      'target'          : ''
    }, options);


    return this.each(function() {        
      $(this).bind('click', function(e){
        e.stopPropagation();
        if($(settings.target).hasClass("on")){
          $(settings.target).hide();
          $(settings.target).removeClass("on");
        }else{
          $(settings.target).show();
          $(settings.target).addClass("on");

          //link each item in the menu
          $(settings.target + " li").each(function(){
            $(this).bind('click', function(){
              //break apart the current url and make a new one with the new link
              var url = location.pathname;
              params = url.split("/");
              var locale = params[1];
              var controller = params[2];
            });
          });
        }
      });//end bind

      $("body").click(function() {
          $(settings.target).hide();
          $(settings.target).removeClass("on");
      });

    });//end each


  };


})( jQuery );

