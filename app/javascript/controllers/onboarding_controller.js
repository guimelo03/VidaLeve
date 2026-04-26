import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "indicator", "title", "subtitle", "status"]

  connect() {
    this.current = 0
    this.saving = false

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
    if (!this.validateStep()) return

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
        this.showFieldError(input, "Campo obrigatório")
        valid = false
      } else {
        this.clearFieldError(input)
      }
    })

    return valid
  }

  showFieldError(input, message) {
    input.classList.add("is-invalid")

    if (
      !input.nextElementSibling ||
      !input.nextElementSibling.classList.contains("error-message")
    ) {
      const error = document.createElement("div")
      error.className = "error-message"
      error.innerText = message
      input.after(error)
    }
  }

  clearFieldError(input) {
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

  autoSave() {
    clearTimeout(this.timeout)

    if (this.saving) return

    this.showSaving()

    this.timeout = setTimeout(() => {
      this.save()
    }, 800)
  }

  async save() {
    this.saving = true

    const form = this.element.querySelector("form")

    try {
      await fetch(form.action, {
        method: "PATCH",
        headers: {
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
          "Accept": "application/json"
        },
        body: new FormData(form)
      })

      this.showSaved()
    } catch {
      this.showSaveError()
    } finally {
      this.saving = false
    }
  }

  showSaving() {
    this.statusTarget.innerText = "Salvando..."
  }

  showSaved() {
    this.statusTarget.innerText = "Salvo ✓"

    setTimeout(() => {
      this.statusTarget.innerText = ""
    }, 2000)
  }

  showSaveError() {
    this.statusTarget.innerText = "Erro ao salvar"
  }
}