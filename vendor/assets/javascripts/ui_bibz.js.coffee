# For turbolink
$(document).on 'ready page:load', ->

  # Submit form when per_page select changing
  $('.grid select').change () ->
    $(this).parents('form').submit()

  # Clear search
  $('.grid .clear-search-btn').click () ->
    $(this).prev().val('')
    $(this).parents('form').submit()
