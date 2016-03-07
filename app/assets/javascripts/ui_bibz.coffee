#= require jquery_ujs
#= require tether
#= require bootstrap-sprockets
#= require bootstrap
#= require table
#= require interface
#= require form
#= require bootstrap-datepicker.min
#= require bootstrap-select.min
#= require bootstrap-switch.min
#= require bootstrap-multiselect.min
#= require multi_column

# For turbolink
$(document).on 'ready page:load', (event) ->

  window.uiBibz = new UiBibz
  return

class UiBibz

  constructor: ->
    @table     = new Table
    @form      = new Form
    @interface = new Interface
