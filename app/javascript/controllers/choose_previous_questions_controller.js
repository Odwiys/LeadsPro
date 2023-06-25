import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="choose-previous-questions"
export default class extends Controller {

  static targets = ["questions"]
  connect() {
    console.log('hello')
  }

  test() {
    console.log('helloss')
  }
}
