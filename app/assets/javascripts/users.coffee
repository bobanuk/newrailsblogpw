# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$().ready ->
  $('#sign_up_user').validate
    rules:
      'user[email]': required: true
      'user[name]': required: true
      'user[password]':
        required: true
        minlength: 5
      'user[password_confirmation]':
        required: true
        minlength: 5
        equalTo: '#user_password.valid'
    messages:
      'user[email]': 'Please enter a valid email address'
      'user[name]': 'Please enter a valid name'
      'user[password]':
        required: 'Please provide a password'
        minlength: 'Your password must be at least 5 characters long'
      'user[password_confirmation]':
        required: 'Please provide a password'
        minlength: 'Your password must be at least 5 characters long'
        equalTo: 'Please enter the same password as above'
  return

$().ready ->
  $('#sign_in_user').validate
    rules:
      'user[email]': required: true
      'user[password]':
        required: true
        minlength: 5
    messages:
      'user[email]': 'Please enter a valid email address'
      'user[password]':
        required: 'Please provide a password'
        minlength: 'Your password must be at least 5 characters long'
  return

$().ready ->
  $('#new_user').validate
    rules:
      'user[name]': required: true
      'user[email]': required: true
      'user[password]':
        required: true
        minlength: 5
      'user[password_confirmation]':
        required: true
        minlength: 5
        equalTo: '#user_password.valid'
    messages:
      'user[name]': 'Please enter a valid name'
      'user[email]': 'Please enter a valid email address'
      'user[password]':
        required: 'Please provide a password'
        minlength: 'Your password must be at least 5 characters long'
      'user[password_confirmation]':
        required: 'Please provide a password'
        minlength: 'Your password must be at least 5 characters long'
        equalTo: 'Please enter the same password as above'
  return

