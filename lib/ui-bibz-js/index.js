import { Tooltip, Toast, Popover } from 'bootstrap'
import UiBibzInterface from './js/interface'
import UiBibzForm from './js/form'
import UiBibzTable from './js/table'

export default class UiBibzJs {

  constructor(){}

  start(){
    document.addEventListener("turbolinks:load", this.init)
  }

  init(){
    console.log('toto')
    new UiBibzTable()
    new UiBibzForm()
    new UiBibzInterface()
  }
}
