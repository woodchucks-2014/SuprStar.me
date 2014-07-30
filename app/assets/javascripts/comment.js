
var seconds = function(date) {
  new Date(date).getTime() / 1000;
}

var Comment = {
  updateComments: function(){
    var latestCommentTime = {time: $(".comment li:last-child").attr("data-time")};

    if (latestCommentTime.time === undefined) {
      var latestCommentTime = {time: 0};
    }

    $.ajax({
      url: "/retrieve_comments",
      method: "POST",
      data: latestCommentTime
    }).success(function(response){
      for (var i=0; i < response.content.length; i++) {
        var time = response.content[i].obj.created_at;
        var time_in_seconds = seconds(time);
        if($(".comment li").size() >= 5) {
          $(".comment li:first-child").slideUp("slow").remove();
        }
        $('.comment').append('<li data-time="'+ time_in_seconds +'">' + response.content[i].obj.content + response.content[i].name + '</li>').hide().fadeIn(1000);
      };
    }).fail(function(response){
      console.log("Either the UL does not contain comments or there is an error with your aJax request.");
    });
  },

  updateQueue: function(){
    $.ajax({
      url: "/retrieve_queue",
      method: "GET"
    }).success(function(response){
      for (var i=0; i < response.queue.length; i++) {
        var song_title = response.queue[i].name;
        var comment = '<li>' + song_title + '</li>';
        if ($('.queue li:contains("'+ song_title +'")').length < 1) {
          $('.queue').append(comment);
        }
      }
    }).fail(function(response){
      console.log("FAILED to updateQueue");
    });
  }
};

var _runPolling = function() {
  setTimeout(function(){
    Comment.updateComments();
    Comment.updateQueue();
    _runPolling();
  }, 5000);
};

$(document).ready(function(){
  $("start").click(function(){
    _runPolling();
  });
});
