import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ['popupContent']

  connect() {
    // console.log('popup connected');
  }

  show() {
    this.popupContentTarget.classList.add('active')
  }

  close() {
    this.popupContentTarget.classList.remove('active')
  }
}
