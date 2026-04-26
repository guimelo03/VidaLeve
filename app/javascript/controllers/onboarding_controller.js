import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "indicator"]

  connect() {
    this.current = 0
    this.showStep()
  }

  next() {
    this.current++
    this.showStep()
  }

  back() {
    this.current--
    this.showStep()
  }

  showStep() {
    this.stepTargets.forEach((el, index) => {
      el.classList.toggle("d-none", index !== this.current)
    })

    this.indicatorTargets.forEach((el, index) => {
      if (index === this.current) {
        el.classList.add("active")
      } else {
        el.classList.remove("active")
      }
    })
  }

  validateStep() {
    const currentStep = this.stepTargets[this.current]
    const inputs = currentStep.querySelectorAll("input, select, textarea")

    let valid = true

    inputs.forEach((input) => {
      if (!input.value.trim()) {
        this.showError(input, "Campo obrigatório")
        valid = false
      } else {
        this.clearError(input)
      }
    })

    return valid
  }

  showError(input, message) {
    input.classList.add("is-invalid")

    if (!input.nextElementSibling || !input.nextElementSibling.classList.contains("error-message")) {
      const error = document.createElement("div")
      error.className = "error-message"
      error.innerText = message
      input.after(error)
    }
  }

  clearError(input) {
    input.classList.remove("is-invalid")

    if (input.nextElementSibling?.classList.contains("error-message")) {
      input.nextElementSibling.remove()
    }
  }

  formatNumber(event) {
    let value = event.target.value.replace(",", ".")
    value = value.replace(/[^\d.]/g, "")

    const parts = value.split(".")
    if (parts.length > 2) {
      value = parts[0] + "." + parts[1]
    }

    event.target.value = value
  }
}