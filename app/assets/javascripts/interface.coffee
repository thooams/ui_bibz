@UiBibzInterface = class Interface

  constructor: ->
    @nav()
    @tooltip()
    @dropdown()

  nav: ->
    $('.nav-tabs a').click (e) ->
      e.preventDefault()
      $(this).tab('show')

  tooltip: ->
    $('[data-toggle="tooltip"]').tooltip()

  dropdown: ->
    $('.dropdown-toggle').dropdown()
