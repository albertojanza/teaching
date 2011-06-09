// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//====================================================================================================================
// Modal Window 
//====================================================================================================================

function show_modal(id) {

  jQuery('#modal-wrapper').fadeIn(100);	
  //jQuery('#modal-wrapper').fadeTo("slow",0.5);	
  //show_popup(id);

}


function hide_modal(id) {

  jQuery('#modal-wrapper, .window').hide();
  jQuery(id).hide();

}

function show_popup(id) {
  //Get the window height and width
  var winH = jQuery(window).height();
  var winW = jQuery(window).width();
              
  //Set the popup window to center
  jQuery(id).css('top',  winH/2-jQuery(id).height()/2);
  jQuery(id).css('left', winW/2-jQuery(id).width()/2);
  //transition effect
  jQuery(id).fadeIn(2000);
}



