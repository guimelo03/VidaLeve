import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]

  switch(event) {
    const index = event.currentTarget.dataset.index

    this.tabTargets.forEach((el, i) => {
      el.classList.toggle("active", i == index)
    })

    this.panelTargets.forEach((el, i) => {
      el.classList.toggle("d-none", i != index)
    })
  }
}
