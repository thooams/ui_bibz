@UiBibzForm = class Form

  constructor: ->
    @switch()          if $('input.switch-field').length > 0
    @inputConnected()  if $('.ui-bibz-connect').length > 0
    @selectPicker()    if $('.dropdown-select-field').length > 0
    @multiSelect()     if $('.multi-select-field').length > 0
    @multiColumn()     if $('.multi-column-field').length > 0
    @formula()         if $('.formula-field').length > 0
    @autoCompleteFix() if $('.auto-complete-field').length > 0

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
      data    = $(this).data()
      classes = $(this)[0].classList.value

      delete data["multiselect"]
      data = Object.assign({ buttonClass: "btn #{ classes }"}, data)
      $(this).multiselect(data)
      $(this).siblings('.btn-group').addClass('input-group-btn') if $(this).parent().hasClass('input-group')

  formula: ->
    me = this
    formula_input_fields = $('.formula-field')
    formula_input_fields.each ->
      me.updateFormulaField($(this))

    formula_input_fields.on 'keyup', ->
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

  autoCompleteFix: ->
    $(".auto-complete-field").each ->
      parent = $(this).parent('.input-group')
      if parent.length > 0
        if parent.children().last().is('datalist')
          radius = parent.children().first().css("border-bottom-left-radius")
          $(this).css("border-bottom-right-radius", radius)
          $(this).css("border-top-right-radius", radius)


