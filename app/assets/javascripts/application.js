// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require cable
//= require channels/chat
//= require jquery.timeago
//= require_self

$(function() {
  $('time.timeago').timeago();
  resizeChat();

  function resizeChat() {
    vph = $(window).height();
    console.log(vph);
    $('#messages').css('height', vph - 180);
  }
  
  $(window).resize(function () {
    resizeChat();  
  })
  
  setTimeout(function() {
    $('.notification').fadeOut('fast');
  }, 3000);

  $('form').bind('ajax:complete', function(){
    $('#message_body').val('');
  });
});
