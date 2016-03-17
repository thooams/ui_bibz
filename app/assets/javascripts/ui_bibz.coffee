#= require jquery
#= require jquery_ujs

#= require tether

# Bootstrap
#= require bootstrap-sprockets
#= require bootstrap
#= require bootstrap-datepicker.min
#= require bootstrap-select.min
#= require bootstrap-switch.min
#= require bootstrap-multiselect.min

#= require multi_column

#= require fix-turbolink

# Ui Bibz
#= require table
#= require interface
#= require form


@UiBibz = class UiBibz

  constructor: ->
    @table     = new window.UiBibzTable
    @form      = new window.UiBibzForm
    @interface = new window.UiBibzInterface
    delete window.UiBibzTable
    delete window.UiBibzForm
    delete window.UiBibzInterface

ready = ->
  window.UiBibz ||= new UiBibz

$(document).ready(ready)
