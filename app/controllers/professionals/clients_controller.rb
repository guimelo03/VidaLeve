class Professionals::ClientsController < Professionals::BaseController
  def index
    @clients = current_user.clients
  end

  def show
    @client = current_user.clients.find(params[:id])

    @diets = @client.diets.order(created_at: :desc)
  end
end
