

$(document).ready(function(){
  $("#partyForm").hide();
  $("#toForm").on("click", function(e){
    e.preventDefault();
    $("#toForm").hide();
    $("#partyForm").fadeIn("slow");
  });
});
