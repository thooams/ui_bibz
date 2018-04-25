@UiBibzInterface = class Interface

  constructor: ->
    @nav()
    @tooltip()
    @dropdown()
    @checkbox()
    @popover()
    @notify()

  nav: ->
    $('.nav-tabs nav-link').tab('show')

  popover: ->
    $('[data-toggle="popover"]').popover({ html: true })

  tooltip: ->
    #$('[data-toggle="tooltip"], [title]').tooltip()
    $('[data-toggle="tooltip"]').tooltip()

  dropdown: ->
    $('.dropdown-toggle').dropdown()

  notify: ->
    $('.alert').each ->
      timeoutValue = $(this).data('timeout')
      if timeoutValue?
        me = $(this)
        setTimeout ->
          me.addClass('fade')
        , timeoutValue


  checkbox: ->
    $('.abc-checkbox.indeterminate input[type=checkbox]').on 'click', ->
      el = $(this)
      if (el.attr('readonly') == 'readonly')
        el.prop('checked', false)
        el.prop('readonly', false)
      else if (!el.is(':checked'))
        el.prop('readonly', true)
        el.prop('indeterminate', true)
