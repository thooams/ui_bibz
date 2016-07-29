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
#= require marked
#= require bootstrap-markdown

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
    @formula   = new window.UiBibzFormula()
    #delete window.UiBibzTable
    #delete window.UiBibzForm
    #delete window.UiBibzInterface

ready = ->
  new UiBibz
  # Fix for turbolinks
  $( "textarea[data-provide*='markdown']" ).markdown() # fix markdown js if turbolinks exists

$(document).on('ready turbolinks:load page:change', ready) # catch event for turbolinks and fix in ready() function
