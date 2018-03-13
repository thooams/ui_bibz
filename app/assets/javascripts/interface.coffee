@UiBibzInterface = class Interface

  constructor: ->
    @nav() if window.stimulus != true
    @tooltip()
    @dropdown()
    @checkbox()
    @popover()

  nav: ->
    $('.nav-tabs a').click (e) ->
      e.preventDefault()
      $(this).tab('show')

  popover: ->
    $('[data-toggle="popover"]').popover({ html: true })

  tooltip: ->
    #$('[data-toggle="tooltip"], [title]').tooltip()
    $('[data-toggle="tooltip"]').tooltip()

  dropdown: ->
    $('.dropdown-toggle').dropdown()

  checkbox: ->
    $('.abc-checkbox.indeterminate input[type=checkbox]').on 'click', ->
      el = $(this)
      if (el.attr('readonly') == 'readonly')
        el.prop('checked', false)
        el.prop('readonly', false)
      else if (!el.is(':checked'))
        el.prop('readonly', true)
        el.prop('indeterminate', true)
