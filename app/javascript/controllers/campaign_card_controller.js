import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  revealContent() {
    this.contentTarget.classList.remove("d-none")
  }
}