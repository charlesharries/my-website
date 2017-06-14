$(document).ready(function() {
  console.log("the document is ready");
  $(".mobile-nav-button").click(function() {
    $("body").toggleClass("show-mobile-nav");
    console.log("it clicked");
  });
});
