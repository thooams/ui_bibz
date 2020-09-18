import UiBibzFormula from './formula'

export default class UiBibzForm {

  constructor() {
    if(document.querySelector('input.switch-field')){ this.bootstrapSwitch() }
    if(document.querySelector('.ui-bibz-connect')) { this.inputConnected() }
    if(document.querySelector('.dropdown-select-field')) { this.selectPicker() }
    if(document.querySelector('.multi-select-field')){ this.multiSelect() }
    if(document.querySelector('.multi-column-field')){ this.multiColumn() }
    if(document.querySelector('.formula-field')){ this.formula() }
    if(document.querySelector('.auto-complete-field')){ this.autoCompleteFix() }
  }

  inputConnected() {
    $('.ui-bibz-connect').inputConnected()
  }

  selectPicker() {
    $('select.dropdown-select-field').selectpicker()
  }

  bootstrapSwitch() {
    $('input.switch-field').bootstrapSwitch({
      size: 'large'
    })
  }

  multiSelect() {
    $('.multi-select-field').each(function() {
      var classes, data
      data = $(this).data()
      classes = $(this)[0].classList.value
      delete data["multiselect"]
      data = Object.assign({
        buttonClass: "btn " + classes
      }, data)
      $(this).multiselect(data)
      if ($(this).parent().hasClass('input-group')) {
        $(this).siblings('.btn-group').addClass('input-group-btn')
      }
    })
  }

  formula() {
    let me = this
    let formula_input_fields = $('.formula-field')

    formula_input_fields.each(function() {
      me.updateFormulaField($(this))
    })

    formula_input_fields.on('keyup', function() {
      me.updateFormulaField($(this))
    })
  }

  updateFormulaField(field) {
    let error, f, formulaAlert, formulaInputField, formulaResultField, formulaSignField, response, result
    formulaInputField = field
    formulaSignField = formulaInputField.siblings('.formula-field-sign')
    formulaResultField = formulaInputField.siblings('.formula-field-result')
    formulaAlert = formulaInputField.siblings('.formula-field-alert')
    f = new UiBibzFormula()
    result = f.go(formulaInputField.val())
    error = result[0]
    response = result[1]

    if (!!error) {
      formulaAlert.attr('data-original-title', error)
      formulaAlert.attr('style', 'display: table-cell')
      formulaResultField.addClass('fix-border-right')
    } else {
      formulaAlert.hide()
      formulaResultField.val(eval(response))
      formulaResultField.removeClass('fix-border-right')
    }
    if (isNaN(response)) {
      formulaSignField.attr('style', 'display: table-cell')
      formulaResultField.attr('style', 'display: table-cell visible: visible')
      formulaInputField.addClass('fix-border-right')
    } else {
      formulaSignField.hide()
      formulaResultField.attr('style', 'visible: hidden')
      formulaInputField.removeClass('fix-border-right')
    }
  }

  multiColumn() {
    $(".multi-column-field").multiSelect()
  }

  autoCompleteFix() {
    $(".auto-complete-field").each(function() {
      var lastChild, parent, radius
      parent = $(this).parent('.input-group')
      if (parent.length > 0) {
        lastChild = parent.children().last()
        if (lastChild.is('datalist')) {
          radius = parent.children().first().css("border-bottom-left-radius")
          $(this).css("border-bottom-right-radius", radius)
          $(this).css("border-top-right-radius", radius)
        }
      }
    })
  }
}
