$(document).ready(function() {
  $("tr[data-link]").click(function(event){
    window.location.href = $(this).data("link")
    event.preventDefault();
  });
})