class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_client!
  def client
  end

  private

  def authorize_client!
    redirect_to root_path, alert: "Acesso não autorizado" unless current_user.client?
  end
end
