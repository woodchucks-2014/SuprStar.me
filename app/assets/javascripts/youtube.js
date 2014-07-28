function onYouTubePlayerReady(playerId) {
  ytplayer = document.getElementById("ytPlayer");
  ytplayer.addEventListener("onError", "onPlayerError");
}

loadVideo = function(videoid) {
  var videoID = videoid //get unique id from the server
  console.log(videoID);
  if (ytplayer) {
    ytplayer.loadVideoById(videoID); //loads by previous variable
  }
}

function loadPlayer(video) {
  var videoID = video;
  var params = { allowScriptAccess: "always"};
  var atts = { id: "ytPlayer" };
  swfobject.embedSWF("http://www.youtube.com/v/" + videoID +
   "?version=3&enablejsapi=1&playerapiid=player1",
   "videoDiv", "640", "360", "9", null, null, params, atts);
}

function _run(videoId) {
  loadPlayer(videoId);
}

$(document).ready(function(){
  $("#videoDiv").hide();

  $("#start").on("click", function(e){
    e.preventDefault();
    $("#start").fadeOut();
    var get_first_video = $.ajax({
      url: "/retrieve_video_id",
      method: "GET",
      dataType: "json"
    });
    get_first_video.success(function(response){
    _run(response.url.youtube_url);
      console.log(response);
      $("#videoDiv").slideDown();
    });
    get_first_video.fail(function(response){
      console.log("Video Failed To Load");
    });
  });

  $("#next").on("click", function(e){
    e.preventDefault();
    // Send ajax request from server getting next video id
    $.ajax({
      url: "/retrieve_video_id",
      method: "GET",
      dataType: "json"
    }).done(function( response ) {
      loadVideo(response.url);
    }).fail(function( response ){
      console.log("Not today!");
    });

  });
});
