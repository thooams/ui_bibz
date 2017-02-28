@UiBibzForm = class Form

  constructor: ->
    @switch()       if $('input.switch').length > 0
    @inputConnected()
    @selectPicker() if $('select.selectpicker').length > 0
    @multiSelect()  if $('.multi-select').length > 0
    @multiColumn()  if $('.multi-column').length > 0
    @formula()      if $('.formula_field_input').length > 0

  inputConnected: ->
    $('.ui-bibz-connect').inputConnected()

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
    me = this
    formula_input_field = $('.formula_field_input')
    me.updateFormulaField(formula_input_field)

    formula_input_field.on 'keyup', ->
      me.updateFormulaField($(this))

  updateFormulaField: (field) ->
    formulaInputField  = field
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
      formulaResultField.attr('style', 'display: table-cell; visible: visible')
      formulaInputField.addClass('fix-border-right')
    else
      formulaSignField.hide()
      formulaResultField.attr('style', 'visible: hidden;')
      formulaInputField.removeClass('fix-border-right')

  multiColumn: ->
    $(".multi-column").multiSelect()
    # $('.multi-column').each ->
    #   data = $(this).data()
    #   delete data["multiselect"]
    #   if data["searchable"]
    #     $(this).multiSelect
    #       selectableOptgroup: if data["selectableOptgroup"] then true else false
    #       selectableHeader:  "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selectable items'><br/>"
    #       selectionHeader:   "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Search in selected items'><br/>"
    #       afterInit: (ms) ->
    #         that                   = this
    #         $selectableSearch      = that.$selectableUl.siblings('input')
    #         $selectionSearch       = that.$selectionUl.siblings('input')
    #         $selectionSearch       = that.$selectionUl.siblings('input')
    #         selectableSearchString = "#" + that.$container.attr("id") + " .ms-elem-selectable:not(.ms-selected)"
    #         selectionSearchString  = "#" + that.$container.attr("id") + " .ms-elem-selection.ms-selected"

    #         that.qs1 = $selectableSearch.quicksearch(selectableSearchString).on("keydown", (e) ->
    #           if e.which is 40
    #             that.$selectableUl.focus()
    #             false
    #         )
    #         that.qs2 = $selectionSearch.quicksearch(selectionSearchString).on("keydown", (e) ->
    #           if e.which is 40
    #             that.$selectionUl.focus()
    #             false
    #         )
    #         return

    #       afterSelect: ->
    #         @qs1.cache()
    #         @qs2.cache()
    #         return

    #       afterDeselect: ->
    #         @qs1.cache()
    #         @qs2.cache()
    #         return
    #   else
    #     $(this).multiSelect(data)
