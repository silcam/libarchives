# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('button#add-author-field').click ->
    show_me = $('div#authors').children().last()
    new_hidden = show_me.clone(true)
    show_me.fadeIn('300')
    show_me.after(new_hidden)

  $('button.remove-author-field').click ->
    $(this).closest('div.author-field').fadeOut('300', ->
      $(this).remove())