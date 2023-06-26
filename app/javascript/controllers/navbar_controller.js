import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['menu']

  connect() {
    console.log(this.menuTarget);
  }

  openMenu() {
    this.menuTarget.classList.add('open')
    document.addEventListener('keyup', this.keyDispatcher.bind(this))
  }

  keyDispatcher(e) {
    e.key === "Escape" && this.closeMenu()
  }

  closeMenu() {
    this.menuTarget.classList.remove('open')
    document.removeEventListener('keyup', this.keyDispatcher)
  }
}
