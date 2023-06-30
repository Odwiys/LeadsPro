import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["options"];

  connect() {
    this.toggleOptionFields();
  }

  toggleOptionFields() {
    const formatValue = this.element.value;
    const optionsTarget = this.optionsTarget;

    if (formatValue === "Multiple-Choice") {
      optionsTarget.classList.remove("d-none");
    } else {
      optionsTarget.classList.add("d-none");
    }
  }
}
