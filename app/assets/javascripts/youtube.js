
// Educated guess lol
loadVideo = function(videoid) {
  var videoID = videoid //get unique id from the server

  if (ytplayer) {
    ytplayer.loadVideoByID(videoID); //loads by previous variable
  }
};

function loadPlayer() {
  // var videoID = //id for party host (first song)
  var params = { allowScriptAccess: "always"};
  var atts = { id: "ytPlayer" };
  swfobject.embedSWF("http://www.youtube.com/v/" + videoID +
                     "?version=3&enablejsapi=1&playerapiid=player1",
                     "videoDiv", "640", "360", "9", null, null, params, atts);
};

// Do I need this or is this for google ajax api?
// var _run = function() {
//   loadPlayer();
// }

(document).ready(function(){
  loadPlayer();
  $("#next").on("click", function(e){
    e.preventDefault();
    // Send ajax request from server getting next video id
    // load video (function)
    $.ajax({
      // Ajax code goes here
    }).done(function( response ) {
      loadVideo(response.videoID);
    }.fail(function( response ){
      console.log("Not today!")
    });
    // _run with updated information
  })
});
