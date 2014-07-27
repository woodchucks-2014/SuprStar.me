// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require jquery_ujs
// = require turbolinks
// = require_tree .



$(function(){
	if ($("#comments").length > 0) {
		setTimeout(updateComments, 5000);
	};
});

function updateComments () {

	var latestCommentTime = {time: $("ul li:last-child").attr("data-time")};
	$.ajax({
		url: "/retrieve_comments",
		method: "POST",
		data: latestCommentTime
	}).done(function( response ) {
		console.log(response.content.length);
		for (var i=0; i < response.content.length; i++) {
			console.log(response);
			console.log(response.content[i].created_at);
			// need to interpolate data time on li tag
		$('.comment').append('<li data-time='+response.content[i].created_at+'>'+ response.content[i].content +'</li>'); 
		};
	}).fail(function( response ){
		console.log("failed");
	});

	setTimeout(updateComments, 5000);
}


