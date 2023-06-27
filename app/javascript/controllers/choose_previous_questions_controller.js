import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="choose-previous-questions"
export default class extends Controller {

  static targets = ["questions", "tom", "addqn", "form"]
  connect() {
    console.log('hello')
  }

  popupQuestions() {
    console.log('helloss')
  }

  submitQuestions(event){
    // event.preventDefault()
    // console.log(this.tomTarget.value)
    console.log(this.formTarget.action)

    // const questions = this.tomTarget.value.split(",")
    // questions.forEach(question => {
    //   const toAdd = `<div class="mb-3 string required disabled lead_name">
    //   <label data-choose-previous-questions-target="addqn" class="form-label string required disabled" for="lead_name">
    //    ${question}<abbr title="required">*
    //   </abbr></label>
    //   <input class="delete-checkbox" type="checkbox">
    //   <input class="form-control string required disabled default-value" value="Lead will input answer here" disabled="disabled" type="text" name="lead[name]" id="lead_name">
    //   </div>`
    //   this.addqnTarget.insertAdjacentHTML("beforeend", toAdd)
    // })

    const csrf = document.querySelector("[name='csrf-token']").content

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": csrf
      },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
       this.addqnTarget.insertAdjacentHTML("beforeend", data.questions_partial)
       this.formTarget.querySelector('input[type="text"][role="combobox"]').value = ""
      })
  }
}
