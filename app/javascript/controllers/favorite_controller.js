import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = [ "form" ]

  setEvent() {
    // const tooltipTriggerList = this.element.querySelectorAll('[data-bs-toggle="tooltip"]')
    // const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
    setTimeout(() => {
      console.log(this.element)
      document.querySelector(".tooltip").addEventListener("click", () => {
        console.log(this.formTarget);

        this.formTarget.requestSubmit()
      })
    }, 100 )
  }
}
