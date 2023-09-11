// Import non minified version, later minifier will make sure minified version
// is provided, while still allowing debugging to use the non minified version.
// import bootstrap from "bootstrap/dist/js/bootstrap.bundle"
import "@popperjs/core"
import "bootstrap"
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap

export default class UiBibzInterface {

  constructor(node) {
    this.node = node || document

    // //this.nav()
    this.tooltip()
    // this.dropdown()
    this.popover()
    this.notify()
    this.toast()
  }

  nav(){
    this.node.querySelectorAll('.nav-tabs .nav-item .nav-link').forEach(function(el){
      let tabTrigger = new bootstrap.Tab(el)
      el.addEventListener('click', function (e) {
        e.preventDefault()
        tabTrigger.show()
      })
    })
  }

  popover() {
    this.node.querySelectorAll('[data-bs-toggle="popover"]').forEach(x => new bootstrap.Popover(x))
  }

  tooltip() {
    this.node.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(x => new bootstrap.Tooltip(x))
  }

  dropdown() {
    this.node.querySelectorAll('[data-bs-toggle="dropdown"]').forEach(x => new bootstrap.Dropdown(x))
  }

  toast() {
    this.node.querySelectorAll('.toast').forEach(x => new bootstrap.Toast(x))
  }

  notify() {
    this.node.querySelectorAll('.alert[data-timeout]').forEach(function(alertElement) {
      setTimeout(function() {
        alertElement.classList.add('fade')
      }, alertElement.getAttribute("data-timeout") )
    })
  }
}
