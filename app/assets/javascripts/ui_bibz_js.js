import UiBibzInterfaces from 'interfaces'
import UiBibzForms from 'forms'
import UiBibzTables from 'tables'

export default class UiBibzJs {

  constructor(){}

  start(){
    if (typeof Turbo == 'undefined') {
      this.init()
    } else {
      document.addEventListener("turbo:load", (e) => this.init())
    }
  }

  init(node){
    if(node === undefined) node = document

    new UiBibzTables(node)
    new UiBibzForms(node)
    new UiBibzInterfaces(node)
  }
}

let uiBibzJs

export function start(){
  uiBibzJs = new UiBibzJs
  uiBibzJs.start()
}

export function init(node) {
  uiBibzJs.init(node)
  return uiBibzJs
}
