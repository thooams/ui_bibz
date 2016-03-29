# Fix for button link in button group
$(document).on 'turbolinks:load page:change ready', ->
  $('.btn-group > a.btn').click ->
    try # Turbolinks exist
      Turbolinks.visit($(this).attr('href'))
    catch exception # Turbolinks doesn't exist
      window.location = $(this).attr('href')
