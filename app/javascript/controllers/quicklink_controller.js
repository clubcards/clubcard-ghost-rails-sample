import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quicklink"
export default class extends Controller {
  static targets = [
    "field",
    "content"
  ]

  connect() {
  }

  putValue(event) {
    this.fieldTarget.value = event.params.value
  }

}
