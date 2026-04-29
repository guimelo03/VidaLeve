class Clients::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_client!
  before_action :require_client

  private

  def authorize_client!
    redirect_to root_path, alert: "Acesso não autorizado" unless current_user.client?
  end

  def require_client
    if current_user.admin?
      redirect_to admin_dashboard_path
    end
  end
end
