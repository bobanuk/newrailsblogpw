# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$().ready ->
  $('#new_comment').validate
    rules: 'comment[comment]': required: true
    messages: 'comment[comment]': 'Please enter a valid comment'
  return


