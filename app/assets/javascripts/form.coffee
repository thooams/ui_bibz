@UiBibzForm = class Form

  constructor: ->
    @switch()         if $('input.switch').length > 0
    @inputConnected() if $('.ui-bibz-connect').length > 0
    @selectPicker()   if $('select.selectpicker').length > 0
    @multiSelect()    if $('.multi-select').length > 0
    @multiColumn()    if $('.multi-column').length > 0
    @formula()        if $('.formula_field_input').length > 0

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
