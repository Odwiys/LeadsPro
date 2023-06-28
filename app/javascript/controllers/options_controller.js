import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["optionsFields"];

  connect() {
    this.toggleOptionsFields();
  }

  toggleOptionsFields() {
    if (this.formatValue === "multiple choice") {
      this.optionsFieldsTarget.classList.remove("d-none");
    } else {
      this.optionsFieldsTarget.classList.add("d-none");
    }
  }

  get formatValue() {
    return this.formatTarget.value;
  }

  get formatTarget() {
    return this.element.querySelector("select[data-target='multiple-choice.format']");
  }
}
