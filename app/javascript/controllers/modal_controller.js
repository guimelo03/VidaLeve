import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    const modal = new bootstrap.Modal(this.element)
    modal.show()
  }
}
