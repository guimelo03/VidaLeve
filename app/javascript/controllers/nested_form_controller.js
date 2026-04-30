import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["meals", "mealTemplate"]

  connect() {
    console.log("nested form conectado.")
  }

  addMeal() {
    const template = this.mealTemplateTarget.innerHTML

    const mealIndex = Date.now().toString()

    const content = template.replace(/MEAL_INDEX/g, mealIndex)

    this.mealsTarget.insertAdjacentHTML("beforeend", content)

    const lastMeal = this.mealsTarget.lastElementChild
    lastMeal.dataset.index = mealIndex

    const input = lastMeal.querySelector("input")
    if (input) input.focus()
  }

  addItem(event) {
    const meal = event.currentTarget.closest("[data-meal]")
    const template = meal.querySelector("[data-items-template]")
    const container = meal.querySelector("[data-items-container]")

    if (!template || !container) return

    const templateContent = template.querySelector("template").innerHTML

    const mealIndex = meal.dataset.index
    const itemIndex = Date.now().toString()

    const content = templateContent
      .replace(/MEAL_INDEX/g, mealIndex)
      .replace(/ITEM_INDEX/g, itemIndex)

    container.insertAdjacentHTML("beforeend", content)
  }

  removeElement(event) {
    const element = event.currentTarget.closest("[data-removable]")
    if (!element) return

    const destroyInput = element.querySelector("input[name*='_destroy']")

    if (destroyInput) {
      destroyInput.value = "1"
      element.style.display = "none"
    } else {
      element.remove()
    }
  }
}