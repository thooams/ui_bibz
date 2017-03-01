$.fn.multiSelect.defaults =
  qs1: null
  qs2: null
  selectableOptgroup: false
  selectableHeader:  "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selectable items'><br/>"
  selectionHeader:   "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selected items'><br/>"
  afterInit: (ms) ->
    that = this
    that.options.selectableOptgroup = if $(this)[0].$element.data('selectableOptgroup') then true else false

    if $(this)[0].$element.data('searchable')
      $selectableSearch      = that.$selectableUl.siblings('input')
      $selectionSearch       = that.$selectionUl.siblings('input')
      $selectionSearch       = that.$selectionUl.siblings('input')
      selectableSearchString = "#" + that.$container.attr("id") + " .ms-elem-selectable:not(.ms-selected)"
      selectionSearchString  = "#" + that.$container.attr("id") + " .ms-elem-selection.ms-selected"

      that.qs1 = $selectableSearch.quicksearch(selectableSearchString).on("keydown", (e) ->
        if e.which is 40
          that.$selectableUl.focus()
          false
      )
      that.qs2 = $selectionSearch.quicksearch(selectionSearchString).on("keydown", (e) ->
        if e.which is 40
          that.$selectionUl.focus()
          false
      )
    else
      that.$selectableContainer.children('.search-input').remove()
      that.$selectionContainer.children('.search-input').remove()

  afterSelect: ->
    @qs1.cache() if @qs1?
    @qs2.cache() if @qs2?

  afterDeselect: ->
    @qs1.cache() if @qs1?
    @qs2.cache() if @qs2?
