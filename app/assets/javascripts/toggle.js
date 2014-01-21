$(function() {
    $('.comments').hide();
    $('.show-comments').click(function() {
    $(this).next('.comments').toggle('slow');
    $(this).text(function(index, text) {
      return text === 'Show comments' ? 'Hide' : 'Show comments'
    });
  });
});