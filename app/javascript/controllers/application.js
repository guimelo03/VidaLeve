import { Application } from "@hotwired/stimulus"
import ToggleController from "./toggle_controller"
import FlashController from "./flash_controller"
import OnboardingController from "./onboarding_controller"

const application = Application.start()

application.debug = false
window.Stimulus   = application

export { application }

application.register("toggle", ToggleController)
application.register("flash", FlashController)
application.register("onboarding", OnboardingController)