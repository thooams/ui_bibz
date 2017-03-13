@UiBibzForm = class Form

  constructor: ->
    @switch()         if $('input.switch-field').length > 0
    @inputConnected() if $('.ui-bibz-connect').length > 0
    @selectPicker()   if $('.dropdown-select-field').length > 0
    @multiSelect()    if $('.multi-select-field').length > 0
    @multiColumn()    if $('.multi-column-field').length > 0
    @formula()        if $('.formula-field').length > 0

  inputConnected: ->
    $('.ui-bibz-connect').inputConnected()

  selectPicker: ->
    $('select.dropdown-select-field').selectpicker
      iconBase: 'fa'
      tickIcon: 'fa-check'
      style:    'btn-secondary'
      showTick: false

  switch: ->
    $('input.switch-field').bootstrapSwitch({ size: 'large' })

  multiSelect: ->
    # http://loudev.com/
    $('.multi-select-field').each ->
      data = $(this).data()
      delete data["multiselect"]
      data = Object.assign({ buttonClass: 'btn btn-secondary', inheritClass: true }, data)
      $(this).multiselect(data)

  formula: ->
    me = this
    formula_input_field = $('.formula-field')
    me.updateFormulaField(formula_input_field)

    formula_input_field.on 'keyup', ->
      me.updateFormulaField($(this))

  updateFormulaField: (field) ->
    formulaInputField  = field
    formulaSignField   = formulaInputField.siblings('.formula-field-sign')
    formulaResultField = formulaInputField.siblings('.formula-field-result')
    formulaAlert       = formulaInputField.siblings('.formula-field-alert')

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
    $(".multi-column-field").multiSelect()
