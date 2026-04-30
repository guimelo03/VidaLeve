class Clients::DashboardController < Clients::BaseController
  def index
    @diets = current_user.diets
  end
end
