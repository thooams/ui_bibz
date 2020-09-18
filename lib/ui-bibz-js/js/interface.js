export default class UiBibzInterface {

  constructor() {
    this.nav()
    this.tooltip()
    this.dropdown()
    this.checkbox()
    this.popover()
    this.notify()
    this.fileInputBrowser()
    this.toast()
  }

  nav(){
    // $('.nav-tabs .nav-item .nav-link').tab('show')
  }

  fileInputBrowser() {
    return bsCustomFileInput.init()
  }

  popover() {
    return $('[data-toggle="popover"]').popover()
  }

  tooltip() {
    return $('[data-toggle="tooltip"]').tooltip()
  }

  dropdown() {
    return $('.dropdown-toggle').dropdown()
  }

  notify() {
    return $('.alert').each(function() {
      var me, timeoutValue
      timeoutValue = $(this).data('timeout')
      if (timeoutValue != null) {
        me = $(this)
        return setTimeout(function() {
          return me.addClass('fade')
        }, timeoutValue)
      }
    })
  }

  checkbox() {
    return $('.abc-checkbox.indeterminate input[type=checkbox]').on('click', function() {
      var el
      el = $(this)
      if (el.attr('readonly') === 'readonly') {
        el.prop('checked', false)
        return el.prop('readonly', false)
      } else if (!el.is(':checked')) {
        el.prop('readonly', true)
        return el.prop('indeterminate', true)
      }
    })
  }

  toast() {
    return $('.toast').toast()
  }
}
