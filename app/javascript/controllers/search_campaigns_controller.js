import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "campaign"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.campaignTarget)
  }

  update() {
    console.log(this.formTarget);
    console.log(this.formTarget.action);
    
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    // i am expecting a response type text, not html
    // not expecting a html response, want just the text format
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}