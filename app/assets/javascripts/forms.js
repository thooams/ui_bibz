import "jquery"
import UiBibzFormula from 'formula'
// import 'bootstrap-switch'
import "input-connected"
import "jquery.multi-select"
import "bootstrap-multiselect"
import extendMultiselect from "jquery.multi-select-extend"
import "bootstrap-markdown"
import 'fuzzysort'
// import "bootstrap-datepicker.min.js"


export default class UiBibzForm {

  constructor(node) {
    this.node = node || document
    if(node.querySelector('input.switch-field')){ this.setBootstrapSwitch() }
    if(node.querySelector('.ui-bibz-connect')) { this.inputConnected() }
    //if(node.querySelector('.dropdown-select-field')) { this.setMultiSelect() }
    if(node.querySelector('.multi-select-field')){ this.setMultiSelect() }
    if(node.querySelector('.multi-column-field')){ this.setMultiColumn() }
    if(node.querySelector('.formula-field')){ this.formula() }
    if(node.querySelector('.auto-complete-field')){ this.autoCompleteFix() }
    if(node.querySelector('.slider')){ this.doubleSlider() }
  }

  inputConnected() {
    $('.ui-bibz-connect', this.node).inputConnected()
  }

  // setSelectPicker() {
  //   $('select.dropdown-select-field', this.node).selectpicker()
  // }

  setBootstrapSwitch() {
    $('input.switch-field', this.node).bootstrapSwitch({
      size: 'large'
    })
  }

  setMultiSelect() {
    $('select.multi-select-field', this.node).each(function() {
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
    let formula_input_fields = $('.formula-field', this.node)

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
      formulaResultField.attr('style', 'display: table-cell; visible: visible')
      formulaInputField.addClass('fix-border-right')
    } else {
      formulaSignField.hide()
      formulaResultField.attr('style', 'visible: hidden')
      formulaInputField.removeClass('fix-border-right')
    }
  }

  setMultiColumn() {
    $.fn.multiSelect.defaults = extendMultiselect
    $(".multi-column-field", this.node).multiSelect()
  }

  autoCompleteFix() {
    $(".auto-complete-field", this.node).each(function() {
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

  doubleSlider(){
    let me = this
    this.node.querySelectorAll(".slider").forEach(function(e){
      let slider = e
      let sliderId = slider.getAttribute("id")
      let sliderMin = me.node.querySelector(`.slider-header[data-target=${sliderId}] .slider-header-min span`)
      let sliderMax = me.node.querySelector(`.slider-header[data-target=${sliderId}] .slider-header-max span`)
      let rangeInput1 = slider.querySelectorAll("input[type=range]")[0]
      let rangeInput2 = slider.querySelectorAll("input[type=range]")[1]
      let inverseLeft = slider.querySelector(".slider-inverse-left")
      let inverseRight = slider.querySelector(".slider-inverse-right")
      let range = slider.querySelector(".slider-range")
      let thumbLeft = slider.querySelector(".slider-thumb-left")
      let thumbRight = slider.querySelector(".slider-thumb-right")
      let signLeft = slider.querySelector(".slider-sign-left")
      let signRight = slider.querySelector(".slider-sign-right")

      rangeInput1.addEventListener("input", function(e){
        this.value = Math.min(this.value, rangeInput2.value-1)
        let value = (100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min)
        value = value +  0.01 * value

        inverseLeft.style.width = `${value}%`
        range.style.left = `${value}%`
        thumbLeft.style.left = `${value}%`
        if(sliderMin){ sliderMin.innerHTML = this.value }
      })

      rangeInput2.addEventListener("input", function(e){
        this.value = Math.max(this.value,rangeInput1.value-(-1))
        let value = (100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min)
        value = value +  0.01 * value

        inverseRight.style.width = `${100-value}%`
        range.style.right = `${100-value}%`
        thumbRight.style.left= `${value}%`
        if(sliderMax){ sliderMax.innerHTML = this.value }
      })
    })
  }
}
