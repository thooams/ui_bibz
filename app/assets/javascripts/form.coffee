@UiBibzForm = class Form

  constructor: ->
    @selectPicker()
    @switch()
    @multiSelect()
    @multiColumn()
    @formula()

  selectPicker: ->
    $('select.selectpicker').selectpicker
      iconBase: 'fa'
      tickIcon: 'fa-check'
      style:    'btn-secondary'

  switch: ->
    $('input.switch').bootstrapSwitch({ size: 'large' })

  multiSelect: ->
    # http://loudev.com/
    $('.multi-select').each ->
      data = $(this).data()
      delete data["multiselect"]
      data = Object.assign({ inheritClass: true }, data)
      $(this).multiselect(data)

  formula: ->
    $('.formula_field_input').on 'keyup', ->
      console.log $(this)
      formulaInputField  = $(this)
      formulaSignField   = formulaInputField.siblings('.formula_field_sign')
      formulaResultField = formulaInputField.siblings('.formula_field_result')
      formulaAlert       = formulaInputField.siblings('.formula_field_alert')

      f        = new window.UiBibzFormula()
      result   = f.go(formulaInputField.val())
      error    = result[0]
      response = result[1]

      if !!error
        formulaAlert.attr('data-original-title', error)
        formulaAlert.attr('style', 'display: table-cell;')
        formulaResultField.addClass('fix-border-right')
      else
        formulaAlert.hide()
        formulaResultField.val(eval(response))
        formulaResultField.removeClass('fix-border-right')

      if isNaN(response)
        formulaSignField.attr('style', 'display: table-cell;')
        formulaResultField.attr('style', 'display: table-cell;')
        formulaInputField.addClass('fix-border-right')
      else
        formulaSignField.hide()
        formulaResultField.hide()
        formulaInputField.removeClass('fix-border-right')

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
