# For turbolink
$(document).on 'ready page:load', ->

  # Submit form when per_page select changing
  $('.grid select').change () ->
    $(this).parents('form').submit()

  # Clear search
  $('.grid .clear-search-btn').click () ->
    $(this).prev().val('')
    $(this).parents('form').submit()

  # Resize search field
  $('.grid input[type=search]').blur ->
    $parent = $(this).parent()
    $parent.removeClass('has-value') if $(this).val() == ''
    $parent.removeClass('is-focused')

  $('.grid input[type=search]').focus ->
    $(this).parent().addClass('is-focused has-value')

  $('.grid input[type=search]').each ->
    $(this).parent().addClass('has-value') if $(this).val() != ''

