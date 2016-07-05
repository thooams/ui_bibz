#= require jquery
#= require jquery_ujs

# multi_column_field component
#= require jquery.quicksearch.min
#= require jquery.multi-select.min

# Bootstrap
#= require tether.min
#= require bootstrap-sprockets
#= require bootstrap

# date_picker_field component
#= require bootstrap-datepicker.min

# dropdown_select_field component
#= require bootstrap-select.min

# switch_field component
#= require bootstrap-switch.min

# multi_select_field component
#= require bootstrap-multiselect.min

# mardown-editor
#= require bootstrap-markdown-bundle

# Ui Bibz
#= require table
#= require interface
#= require formula
#= require form
#= require fix_bootstrap

@UiBibz = class UiBibz

  constructor: ->
    @table     = new window.UiBibzTable()
    @form      = new window.UiBibzForm()
    @interface = new window.UiBibzInterface()
    #delete window.UiBibzTable
    #delete window.UiBibzForm
    #delete window.UiBibzInterface

ready = ->
  new UiBibz

$(document).on('turbolinks:load page:change', ready)
