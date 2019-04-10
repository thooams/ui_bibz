@UiBibzInterface = class Interface

  constructor: ->
    @nav()
    @tooltip()
    @dropdown()
    @checkbox()
    @popover()
    @notify()
    @fileInputBrowser()
    @toast()

  nav: ->
    #$('.nav-tabs .nav-item .nav-link').tab('show')

  fileInputBrowser: ->
    bsCustomFileInput.init()

  popover: ->
    $('[data-toggle="popover"]').popover()

  tooltip: ->
    #$('[data-toggle="tooltip"], [title]').tooltip()
    $('[data-toggle="tooltip"]').tooltip()

  dropdown: ->
    $('.dropdown-toggle').dropdown()
    # $('.dropdown-toggle').on 'click', ->
    #   $(this).next().toggle()
    # $('.dropdown-menu.keep-open').on 'click', (e) ->
    #   e.stopPropagation()

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

  toast: ->
    $('.toast').toast()

