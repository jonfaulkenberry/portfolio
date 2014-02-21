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

$(function(){ $(document).foundation(); });
