function seconds(datetime) {
  return new Date(datetime).getTime() / 1000;
};

$(function(){
  if ($("#comments").length > 0) {
    setTimeout(updateLists, 5000);
  };
});

function updateLists () {

  var latestCommentTime = {time: $(".comment li:last-child").attr("data-time")};
  var updateComment = $.ajax({
    url: "/retrieve_comments",
    method: "POST",
    data: latestCommentTime
  });
  updateComment.done(function( response ) {
    for (var i=0; i < response.content.length; i++) {
      var time = response.content[i].obj.created_at;
      var time_in_seconds = seconds(time);
      if($("li").size() >= 5) {
        $(".comment li:first-child").slideUp("slow").remove();
        $('.comment').append('<li data-time="'+ time_in_seconds +'">' + response.content[i].obj.content + response.content[i].name +'</li>').fadeIn();
      } else {
        $('.comment').append('<li data-time="'+ time_in_seconds +'">' + response.content[i].obj.content + response.content[i].name + '</li>').fadeIn();
      }
    };
  });
  updateComment.fail(function( response ){
    console.log("No Comments yet");
  });
// <--------------------------------------------------->
  var updateQueue = $.ajax({
    url: "/retrieve_queue",
    method: "GET"
  });

  updateQueue.done(function(response){
    // Primary Focus: iterating through queue and appending new li's if they exist

    for (var i=0; i < response.queue.length; i++) {
      var comment = '<li>' + response.queue[i].name + '</li>';
      // console.log($('.queue li:last-child').html() !== response.queue[i].name);
      console.log($('.queue li:contains("'+ response.queue[i].name +'")').length);
      // console.log($('li[value="'+ response.queue[i].name + '"]').length);
      console.log(response.queue[i].name === $('.queue').find('li[value="'+ response.queue[i].name + '"]'));
      if ($('.queue li:contains("'+ response.queue[i].name +'")').length < 1) {
        $('.queue').append(comment);
      }
    }
  });

  updateQueue.fail(function(response){
    console.log("FAIL");
  });

  setTimeout(updateLists, 5000);
}
