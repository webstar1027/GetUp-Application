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
//= require js/core/jquery.min.js
//= require cocoon
//= require js/core/popper.min.js
//= require js/core/bootstrap-material-design.min.js
//= require js/plugins/sweetalert2.js
//= require js/plugins/moment.min.js
//= require js/plugins/bootstrap-datetimepicker.js
//= require js/plugins/nouislider.min.js
//= require js/plugins/bootstrap-tagsinput.js
//= require js/plugins/bootstrap-selectpicker.js
//= require js/plugins/jasny-bootstrap.min.js
//= require js/plugins/jquery.flexisel.js
//= require js/plugins/jquery-jvectormap.js
//= require demo/modernizr.js
//= require demo/vertical-nav.js
//= require demo/demo.js
//= require js/material-kit.js
//= require dropzone
//= require activestorage
//= require_tree .



  $(document).ready(function() {
    materialKitDemo.initContactUs2Map();
  });