document.addEventListener('turbolinks:load', function() {
  $("tr[data-link]").click(function(event){
    console.log("click")
    window.location.href = $(this).data("link")
    event.preventDefault();
  });
})