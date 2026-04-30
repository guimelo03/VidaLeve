import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["meals", "mealTemplate"]

  connect() {
    console.log("nested form conectado.")

    this.addMeal()
  }

  addMeal() {
    const content = this.mealTemplateTarget.innerHTML
    this.mealsTarget.insertAdjacentHTML("beforeend", content)

    const lastMeal = this.mealsTarget.lastElementChild
    const input = lastMeal.querySelector("input")

    if (input) input.focus()
  }

  addItem(event) {
    const meal = event.currentTarget.closest("[data-meal]")
    const template = meal.querySelector("[data-items-template]")
    const container = meal.querySelector("[data-items-container]")

    if (!template || !container) return

    const templateContent = template.querySelector("template").innerHTML
    container.insertAdjacentHTML("beforeend", templateContent)
  }

  removeElement(event) {
    const element = event.currentTarget.closest("[data-removable]")

    if (!element) return

    element.remove()
  }
}