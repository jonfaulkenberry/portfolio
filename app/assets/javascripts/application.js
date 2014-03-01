//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require foundation
//= require_tree .
//= require_tree ../../../vendor/assets/javascripts
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks 

NProgress.configure({
  showSpinner: false,
  ease: 'ease',
  speed: 500
});

$( document ).ready(function() {
  $( ".search-btn, .search-back-icon, .search-box" ).css("display", "none");
  $( ".search-icon, .search-back-icon" ).click(function() {
    $( ".topnav-link, .search-icon, .search-back-icon, .search-box, .search-btn" ).toggle( "fast" );
  });
});

$(function(){ $(document).foundation(); });
