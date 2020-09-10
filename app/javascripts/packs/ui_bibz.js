// import { UiBibzTable } from 'table'
// import { UiBibzForm } from 'form'
// import { UiBibzInterface } from 'interface'
// import { UiBibzFormula } from 'formula'

export class UiBibz {

  constructor(){}

  start(){
    document.addEventListener("turbolinks:load", init)
  }

  init(){
    console.log('toto')
    // UiBibzTable.init()
    // UiBibzForm.init()
    // UiBibzTable.init()
    // UiBibzInterface.init()
    // UiBibzFormula.init()
  }
}
