//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require foundation 
//= require toastr
//= require codemirror
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .

//= stub google_analytics

$( document ).ready(function() {
  $( ".search-btn, .search-back-icon, #search" ).css("display", "none");
  $( ".search-icon, .search-back-icon" ).click(function() {
    $( ".topnav-link, .search-icon, .search-back-icon, #search, .search-btn" ).toggle( "fast" );
  });
});

$(function(){ $(document).foundation(); });
