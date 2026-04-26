import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.element.classList.add("flash-enter")

        requestAnimationFrame(() => {
            this.element.classList.add("flash-enter-active")
        })

        setTimeout(() => {
            this.element.classList.add("fade-out")

            setTimeout(() => {
                this.element.remove()
            }, 400)
        }, 3000)
    }
}