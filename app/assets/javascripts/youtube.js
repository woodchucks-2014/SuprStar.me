function onYouTubePlayerReady(playerId) {
  ytplayer = document.getElementById("ytPlayer");
  ytplayer.addEventListener("onError", "onPlayerError");
}

// Educated guess lol
loadVideo = function(videoid) {
  var videoID = videoid //get unique id from the server
  console.log(videoID);
  if (ytplayer) {
    ytplayer.loadVideoById(videoID); //loads by previous variable
  }
}

function loadPlayer() {
  var videoID = 'NiXbRBS5Z58'
  var params = { allowScriptAccess: "always"};
  var atts = { id: "ytPlayer" };
  swfobject.embedSWF("http://www.youtube.com/v/" + videoID +
   "?version=3&enablejsapi=1&playerapiid=player1",
   "videoDiv", "640", "360", "9", null, null, params, atts);
}


function _run() {
  loadPlayer();
}

$(document).ready(function(){
  _run();
  $("#next").on("click", function(e){
    e.preventDefault();
    // Send ajax request from server getting next video id
    $.ajax({
      url: "/retrieve_video_id",
      method: "GET",
      dataType: "json"
    }).done(function( response ) {
      loadVideo(response.videoID);
    }).fail(function( response ){
      console.log("Not today!");
    });

  });
});
