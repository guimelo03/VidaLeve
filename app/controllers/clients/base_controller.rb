class Clients::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_client!
  before_action :require_client

  include UserParams

  private

  def authorize_client!
    redirect_to root_path, alert: "Acesso não autorizado" unless current_user.client?
  end

  def require_client
    if current_user.admin?
      redirect_to admin_dashboard_path
    end
  end

  def require_complete_profile!
    return if current_user.has_complete_info?

    redirect_to clients_profile_path,
      alert: "Complete seu perfil primeiro."
  end
end
