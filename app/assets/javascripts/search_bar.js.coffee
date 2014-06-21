$ ->
  $( ".search-btn, .search-back-icon, #search" ).css("display", "none")
  $( ".search-icon, .search-back-icon" ).click ()->
    $( ".topnav-link, .search-icon, .search-back-icon, #search, .search-btn" ).toggle( "fast" )