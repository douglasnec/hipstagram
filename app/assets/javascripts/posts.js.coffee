# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#tag-input').inputosaurus
    width: '250px'
    autoCompleteSource : ['winter', 'snow', 'remote', 'amazing']
    activateFinalResult : true

  $('.show-comments').on 'click', (e) ->
    e.preventDefault()
    button = this
    $('.spinner').show()
    $(this).hide()

    $.get $(this).data('url'), (comments) ->
      comments.forEach (comment) ->
        newComment = Mustache.render $('#comment-template').html(), comment
        $(newComment).appendTo('.comments-container')
      $('.comments-container').slideDown()
      $('.spinner').hide()


