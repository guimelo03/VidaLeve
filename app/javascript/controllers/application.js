import { Application } from "@hotwired/stimulus"
import ToggleController from "./toggle_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

application.register("toggle", ToggleController)
