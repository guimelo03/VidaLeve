import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "indicator", "title", "subtitle"]

  connect() {
    this.current = 0

    this.titles = [
      "Seus dados básicos",
      "Sua rotina",
      "Seu objetivo"
    ]
  
    this.subtitles = [
      "Leva menos de 1 minuto",
      "Queremos entender seu dia a dia",
      "Isso nos ajuda a personalizar tudo pra você"
    ]

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
      el.classList.toggle("active", index === this.current)
    })

    this.titleTarget.innerText = this.titles[this.current]
    this.subtitleTarget.innerText = this.subtitles[this.current]
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