$(document).ready(function() {
  $("body").on("submit", ".new_comment", function(event){
    event.preventDefault();

    var $form = $(this),
      data = $form.serialize(),
      url = $form.attr("action");

    $.ajax({
      method: "POST",
      data: data,
      url: url,
      dataType: "json",
      success: function(data) {
        html_result = "<p>"
        if(data.gravatar != "") {
          html_result += "<img src='"+data.gravatar+"' alt='avatar' width='40' />";
        }
        html_result += data.name+"<br/>"+data.comment+"<br/>"+data.created_at+"<hr/></p>";
        $('.comments_content').prepend(html_result);
        $(".comment_count span").html(data.count)
      },
      error: function (jqXHR, textStatus, errorThrown) {
        alert("Sorry something went wrong: " + errorThrown) 
      }
    });
  });
});
