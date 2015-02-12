# For turbolink
$(document).on 'ready page:load', ->
  $('.grid select').change () ->
    console.log($(this))
    $(this).parents('form').submit()
