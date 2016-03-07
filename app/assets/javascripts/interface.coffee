@Interface = class Interface

  constructor: ->
    @nav()
    @tooltip()

  nav: ->
    $('.nav-tabs a').click (e) ->
      e.preventDefault()
      $(this).tab('show')

  tooltip: ->
    $('[data-toggle="tooltip"]').tooltip()


