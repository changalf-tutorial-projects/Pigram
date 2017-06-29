$(document).on('turbolinks:load', function() {
  setTimeout(function(){
    $('.alert').slideUp(500);
  }, 1000);
})

var loadFile = function(event) {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};