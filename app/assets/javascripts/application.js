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
function seconds(datetime) {
	return new Date().getTime() / 1000;
};

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
		for (var i=0; i < response.content.length; i++) {
			var time = response.content[i].created_at;
			var time_in_seconds = seconds(time).to_s;
			if($("li").size() > 5) {
				console.log("here")
				$(".comment li").eq(1).slideUp("slow").remove();
			};
			$('.comment ul').append('<li data-time='+ time_in_seconds +'>'+ response.content[i].content +'</li>').hide().fadeIn();
		};
	}).fail(function( response ){
		console.log("failed");
	});

	setTimeout(updateComments, 5000);
}
