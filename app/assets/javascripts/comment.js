
var seconds = function(date) {
 return new Date(date).getTime() / 1000;
}

var Comment = {
  updateComments: function(){
    var latestCommentTime = {time: $(".comment li:last-child").attr("data-time")};
    console.log(latestCommentTime);
    if (latestCommentTime.time === undefined) {
      var latestCommentTime = {time: 0};
    }
    console.log(latestCommentTime);
    $.ajax({
      url: "/retrieve_comments",
      method: "POST",
      data: latestCommentTime
    }).success(function(response){
      $('meter').data('value', (50 + response.sentimental_score);
      for (var i=0; i < response.content.length; i++) {
        var time = response.content[i].obj.created_at;
        var time_in_seconds = seconds(time);
        console.log(response.content[i]);
        console.log(response);
        if($(".comment li").size() >= 5) {
          $(".comment li:first-child").slideUp("slow", function(){
            $(".comment li:first-child").remove();
          });
        }
        $('.comment').append('<li data-time="'+ time_in_seconds +'">' + response.content[i].obj.content + response.content[i].name + '</li>');
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
      console.log(response);
      for (var i=0; i < response.queue.length; i++) {
        var song_title = response.queue[i].name;
        console.log(response.queue[i]);
        var itemQueue = '<li id="'+ response.queue[i].id +'">' + song_title + '</li>';
        var howManyFound = $('.queue').find("li[id='"+ response.queue[i].id +"']").size();
        console.log(howManyFound);
        if ( howManyFound < 1) {
          console.log($('.queue li').size());
          if ($('.queue li').size() > 5) {
            console.log("less than 5");
            $(".queue").append(itemQueue).hide(); // *****note
          } else {
          $(".queue").append(itemQueue);
          }
        }
      }
    $(".queue li").hide(); //Called when new comment is added?
    $(".queue li:lt(5)").show();
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
    _runPolling();
});
