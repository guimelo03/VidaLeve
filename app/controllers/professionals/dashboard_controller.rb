class Professionals::DashboardController < Professionals::BaseController
  def index
    @clients = current_user.clients
    @recent_diets = current_user.client_diets.order(created_at: :desc).limit(5)
  end
end
