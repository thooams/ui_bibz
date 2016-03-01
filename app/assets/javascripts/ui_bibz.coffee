#= require jquery2
#= require jquery_ujs
#= require tether
#= require bootstrap-sprockets
#= require bootstrap
#= require bootstrap-datepicker.min
#= require bootstrap-select.min
#= require bootstrap-switch.min
#= require bootstrap-multiselect.min
#= require multi_column

# For turbolink
$(document).on 'ready page:load', ->

  # Submit form when per_page select changing
  $('.table-pagination-per-page select').change () ->
    $(this).parents('form').submit()

  # Clear search
  $('.table-search-field .clear-search-btn').click () ->
    $(this).prev().val('')
    $(this).parents('form').submit()

  # Resize search field
  $('.table-card input[type=search]').blur ->
    $parent = $(this).parent()
    $parent.removeClass('has-value') if $(this).val() == ''
    $parent.removeClass('is-focused')

  $('.table-card input[type=search]').focus ->
    $(this).parent().addClass('is-focused has-value')

  $('.table-card input[type=search]').each ->
    $(this).parent().addClass('has-value') if $(this).val() != ''

  $('.selectpicker').selectpicker()

  $('.switch').bootstrapSwitch()

  $('.nav-tabs a').click (e) ->
    e.preventDefault()
    $(this).tab('show')

  $('.multi-select').each ->
    data = $(this).data()
    delete data["multiselect"]
    data = Object.assign({ inheritClass: true }, data)
    $(this).multiselect(data)

  $('[data-toggle="tooltip"]').tooltip()
