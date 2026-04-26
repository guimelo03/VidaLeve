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
        input.classList.add("is-invalid")
        valid = false
      } else {
        inputs.classList.remove("is-invalid")
      }
    })
    
    return valid
  }
}