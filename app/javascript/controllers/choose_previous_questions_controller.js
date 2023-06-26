import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="choose-previous-questions"
export default class extends Controller {

  static targets = ["questions"]
  connect() {
    console.log('hello')

    console.log(';byebye')

    const a = Object.getOwnPropertyNames(Object.getPrototypeOf(this))
    console.log(a)
  }

  popupQuestions() {
    console.log('helloss')
  }
}
