// controllers/stats_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "button", "number"]

  show(event) {
    const type = event.currentTarget.dataset.type

    this.panelTargets.forEach((el) => {
      el.classList.toggle("d-none", el.dataset.type !== type)
    })

    this.buttonTargets.forEach((btn) => {
      btn.classList.toggle("active", btn.dataset.type === type)
    })

    const activePanel = this.panelTargets.find(el => el.dataset.type === type)
    const numberEl = activePanel.querySelector("[data-stats-target='number']")

    this.animate(numberEl)
  }

  animate(el) {
    const target = parseInt(el.dataset.value)
    let current = 0
    const step = Math.ceil(target / 30)

    const interval = setInterval(() => {
      current += step
      if (current >= target) {
        current = target
        clearInterval(interval)
      }
      el.textContent = `+${current}`
    }, 20)
  }
}