import { Controller } from "@hotwired/stimulus"
import debounce from "debounce"

export default class ComboboxController extends Controller {
  static values = { url: String, debounce: Number };

  search(e) {
    let debounceValue = this.element.getAttribute("data-combobox-debounce-value")

    if (debounceValue > 0){
      debounce(this.searchValue(e), debounceValue);
    }
    else {
      this.searchValue(e);
    }
  }

  insertValue(e){
    this.element.querySelector('input').value = e.target.innerText
    this.element.querySelector("turbo-frame").innerHTML = ''
  }

  searchValue(e){
    let input = this.element.querySelector('input')
    let query = input.value
    if (query.length < 2) {
      return
    }

    const url = this.element.getAttribute("data-combobox-url-value") + '?query=' + query;

    input.nextSibling.querySelector("turbo-frame").src = url;
  }
}
