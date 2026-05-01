class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.client?
      clients_dashboard_path
    elsif resource.admin?
      admin_dashboard_path
    elsif resource.professional?
      professionals_dashboard_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
