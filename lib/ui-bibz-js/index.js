import UiBibzInterface from './lib/interface'
import UiBibzForm from './lib/form'
import UiBibzTable from './lib/table'

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
