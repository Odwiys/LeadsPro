import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-question-option"
export default class extends Controller {
  static targets = ["optionsList"]

  connect() {
    console.log("test test test")
  }

  addOption(){
    const currentOptionsCount = this.optionsListTarget.querySelectorAll(".option-fields").length;

    const new_option_html = `<div class="option-fields">
              <div class="mb-3 string required question_options_value"><label class="form-label string required" for="question_options_attributes_${currentOptionsCount}_value">Option <abbr title="required">*</abbr></label><input class="form-control string required" type="text" name="question[options_attributes][${currentOptionsCount}][value]" id="question_options_attributes_${currentOptionsCount}_value"></div>
              <div class="mb-3 float required question_options_sentiment_value"><label class="form-label float required" for="question_options_attributes_${currentOptionsCount}_sentiment_value">Sentiment Value <abbr title="required">*</abbr></label><input class="form-control numeric float required" min="0" max="10" type="number" step="any" name="question[options_attributes][${currentOptionsCount}][sentiment_value]" id="question_options_attributes_${currentOptionsCount}_sentiment_value"></div>
            </div>`

    this.optionsListTarget.insertAdjacentHTML("beforeend", new_option_html)
  }
}
