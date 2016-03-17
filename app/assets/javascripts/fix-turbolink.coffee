# Fix components issues if turbolinks gem exists
# 'turbolinks:load' and 'page:change' if turbolinks gem exists, and 'ready' if not

$(document).on 'turbolinks:load ready page:change', ->
  $('.dropdown-toggle').dropdown()
  $('.switch').bootstrapSwitch()
  $('.multi-select').multiSelect()
  return
