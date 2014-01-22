$(function() {
  $('.heart').click(function() {
    $(this).text(function(index, text) {
      return text === '♡' ? '♥' : '♡'
    });
  });
});