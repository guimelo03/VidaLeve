import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.format()
  }

  format() {
    this.element.addEventListener("input", (e) => {
      let v = e.target.value.replace(/\D/g, "")

      if (v.lenght > 11) v = v.slice(0, 11)
      
      if (v.length > 10) {
        v = v.replace(/^(\d{2})(\d{5})(\d{4})$/, "($1) $2-$3")
      } else if (v.length > 6) {
        v = v.replace(/^(\d{2})(\d{4})(\d{0,4})$/, "($1) $2-$3")
      } else if (v.length > 2) {
        v = v.replace(/^(\d{2})(\d{0,5})$/, "($1) $2")
      }


      e.target.value = v
    })
  }
}
