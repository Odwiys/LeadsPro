import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="individual-email"
export default class extends Controller {
  // static targets = { leadID: Number }
  // static targets = ['message']

  connect() {
    console.log('controller connected');
    // console.log(this.messageTarget);
  }
}
