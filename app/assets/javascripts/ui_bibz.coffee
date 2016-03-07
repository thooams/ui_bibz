#= require jquery_ujs
#= require tether
#= require bootstrap-sprockets
#= require bootstrap
#= require bootstrap-datepicker.min
#= require bootstrap-select.min
#= require bootstrap-switch.min
#= require bootstrap-multiselect.min
#= require multi_column

# Ui Bibz
#= require table
#= require interface
#= require form

# For turbolink
$(document).on 'ready page:load', (event) ->

  window.UiBibz ||= new UiBibz
  return

class UiBibz

  constructor: ->
    @table     = new window.Table
    @form      = new window.Form
    @interface = new window.Interface
    delete window.Table
    delete window.Form
    delete window.Interface
