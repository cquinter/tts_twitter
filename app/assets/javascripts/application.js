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
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {

	$('#unfollow_btn').hover(function() {
		// Hovering
		$(this).removeClass('btn-success');
		$(this).addClass('btn-danger');
		$(this).html("Unfollow");

	}, function() {
		// No longer hovering
		$(this).html("Following");
		$(this).removeClass('btn-danger');
		$(this).addClass('btn-success');
	});

});
