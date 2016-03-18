#= require jquery
#= require jquery_ujs

#= require jquery.quicksearch.min
#= require jquery.multi-select.min

# Bootstrap
#= require tether
#= require bootstrap-sprockets
#= require bootstrap
#= require bootstrap-datepicker.min
#= require bootstrap-select.min
#= require bootstrap-switch.min
#= require bootstrap-multiselect.min

# Ui Bibz
#= require table
#= require interface
#= require form


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
