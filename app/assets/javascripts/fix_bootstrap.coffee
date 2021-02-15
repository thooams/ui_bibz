# Fix for button link in button group
$(document).on 'turbolinks:load turbo:load page:change ready', ->
  $('.btn-group > a.btn, .dropdown-item').click ->
    try # Turbo/Turbolinks exist
      (Turbolinks || Turbo).visit($(this).attr('href'))
    catch exception # Turbo/Turbolinks doesn't exist
      window.location = $(this).attr('href')
