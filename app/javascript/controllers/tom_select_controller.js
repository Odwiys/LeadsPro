import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = {
    options: Array
  }

  connect() {
    new TomSelect(this.element, {
      options: this.optionsValue
    });
  }
}
