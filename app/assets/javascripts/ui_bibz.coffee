#= require jquery2
#= require jquery-ui.min
#= require all

# multi_column_field component
#= require jquery.quicksearch.min
#= require jquery.multi-select.min
#= require jquery.multi-select-extend

# Bootstrap
#= require tether.min
#= require popper
#= require bootstrap

# date_picker_field component
#= require bootstrap-datepicker.min

# dropdown_select_field component
#= require bootstrap-select.min

# switch_field component
#= require bootstrap-switch.min

# multi_select_field component
#= require bootstrap-multiselect.min

# input_connected
#= require input-connected

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

  constructor: (args = {}) ->
    @turbolinks    = args.turbolinks
    @fontawesomejs = if args.fontawesomejs? then args.fontawesomejs else true
    return false

  initial: (fontawesomejs) ->
    if fontawesomejs
      # https://github.com/tomkra/font_awesome5_rails/issues/17
      FontAwesome.config =
        observeMutations: false
      FontAwesome.dom.i2svg()

    new window.UiBibzTable()
    new window.UiBibzForm()
    new window.UiBibzInterface()
    new window.UiBibzFormula()
    $("textarea[data-provide*='markdown']").markdown() # fix markdown js if turbolinks exists
    return false

  ready: ->
    me = this
    if @turbolinks?
      $(document).on('turbolinks:load', me.initial(@fontawesomejs)) # catch event for turbolinks and fix in ready() function
    else
      $(document).on('ready', me.initial(@fontawesomejs))

