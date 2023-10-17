import { Controller } from "@hotwired/stimulus"
import debounce from "debounce"

export default class ComboboxController extends Controller {
  static values = { url: String, debounce: Number };

  connect(){
    this.searchValue = this.searchValue.bind(this);
    this.debounceValue = this.element.getAttribute("data-combobox-debounce-value")
    this.debouncedSearchValue = debounce(this.searchValue, this.debounceValue)
  }

  search(e) {
    if (this.debounceValue && Number(this.debounceValue) > 0){
      this.debouncedSearchValue(e);
    }else {
      this.searchValue(e);
    }
  }

  insertValue(e){
    this.element.querySelector('input').value = e.target.innerText
    this.element.querySelector("turbo-frame").innerHTML = ''
  }

  searchValue(){
    let input = this.element.querySelector('input')
    let query = input.value
    if (query.length < 2) {
      return
    }

    const url = this.element.getAttribute("data-combobox-url-value") + '?query=' + query;

    input.nextSibling.querySelector("turbo-frame").src = url;
  }
}
