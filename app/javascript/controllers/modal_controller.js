import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  connect() {
    if (sessionStorage.getItem("onboardingModalShown")) return

    const modal = new bootstrap.Modal(this.element)
    modal.show()

    sessionStorage.setItem("onboardingModalShown", "true")
  }
}