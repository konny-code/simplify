import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-scroll"
export default class extends Controller {
  connect() {
    // this.element is the element where we placed the controller in the html
    // console.log(this.element);
    this.element.scrollIntoView();
  }
}
