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
//= require jquery.turbolinks
//= require jquery_ujs

$(document).ready(function() {
    $('#resume_attachment').on('change', function(){ 
      if($('#resume_attachment').val() == "") {
        $('#submit_attachment').prop('disabled', true);
        console.log('ok');
      }
      else {
        $('#submit_attachment').prop('disabled', false);
        console.log('ko');
      }
    });
});

//= require turbolinks
//= require_tree .
