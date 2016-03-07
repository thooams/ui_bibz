class Form

  constructor: ->
    @selectPicker()
    @switch()
    @multiSelect()

  selectPicker: ->
    $('.selectpicker').selectpicker()

  switch: ->
    $('.switch').bootstrapSwitch()

  multiSelect: ->
    $('.multi-select').each ->
      data = $(this).data()
      delete data["multiselect"]
      data = Object.assign({ inheritClass: true }, data)
      $(this).multiselect(data)
