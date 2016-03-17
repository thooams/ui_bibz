# Fix components issues if turbolinks gem exists
# 'turbolinks:load' if turbolinks gem exists, and 'ready' if not

$(document).on 'turbolinks:load ready', ->
  $('.dropdown-toggle').dropdown()
  $('.switch').bootstrapSwitch()
  $('.multi-select').multiSelect()
  return
