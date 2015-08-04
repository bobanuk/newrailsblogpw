# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$().ready ->
  $('#new_post').validate
    rules:
      'post[title]': required: true
      'post[content]': required: true
      'post[tag_list]': required: true
    messages:
      'post[title]': 'Please enter a valid title'
      'post[content]': 'Please enter a valid content'
      'post[tag_list]': 'Please enter a valid tag'
  return