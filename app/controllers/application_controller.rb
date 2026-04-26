class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.client?
      client_dashboard_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private

  def ensure_onboarding_completed
    return unless user_signed_in?
    return if current_user.has_complete_info?
    return if controller_name == "users" && [ "onboarding", "update_onboarding" ].include?(action_name)

    return if devise_controller?

    redirect_to onboarding_path, alert: "Complete seu perfil para continuar"
  end
end
