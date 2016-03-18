@UiBibzForm = class Form

  constructor: ->
    @selectPicker()
    @switch()
    @multiSelect()
    @multiColumn()

  selectPicker: ->
    $('.selectpicker').selectpicker()

  switch: ->
    $('.switch').bootstrapSwitch()

  multiSelect: ->
    # http://loudev.com/
    $('.multi-select').each ->
      data = $(this).data()
      delete data["multiselect"]
      data = Object.assign({ inheritClass: true }, data)
      $(this).multiselect(data)

  multiColumn: ->
    $('.multi-column').each ->
      data = $(this).data()
      delete data["multiselect"]
      if data["searchable"]
        $(this).multiSelect
          selectableOptgroup: if data["selectableOptgroup"] then true else false
          selectableHeader:  "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selectable items'><br/>"
          selectionHeader:   "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selected items'><br/>"
          afterInit: (ms) ->
            that                   = this
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
            return

          afterSelect: ->
            @qs1.cache()
            @qs2.cache()
            return

          afterDeselect: ->
            @qs1.cache()
            @qs2.cache()
            return
      else
        $(this).multiSelect(data)
