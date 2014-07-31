$(document).ready(function(){
  $("#partyForm").hide();
  $("#toForm").click(function(e){
    e.preventDefault();
    $("#toForm").hide();
    $("#partyForm").fadeIn("slow");
  });



$('.team-member').mouseover(function(){
    $('this').effect("shake");
});
});
