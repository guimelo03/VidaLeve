class Professionals::DietsController < Professionals::BaseController
  before_action :set_client

  def new
    @diet = @client.diets.build
    @user = @client

    render "admin/diets/new"
  end

  def edit
    @diet = @client.diets.find(params[:id])
    @user = @client

    render "admin/diets/edit"
  end

  def show
    @diet = @client.diets.find(params[:id])
    @user = @client

    render "admin/diets/show"
  end

  def create
    @diet = @client.diets.build(diet_params)

    if @diet.save
      redirect_to professionals_client_diet_path(@client, @diet), notice: "Dieta criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @diet = @client.diets.find(params[:id])

    if @diet.update(diet_params)
      redirect_to professionals_client_diet_path(@client, @diet), notice: "Dieta atualizada com sucesso."
    else
      @user = @client

      render "admin/diets/edit", status: :unprocessable_entity
    end
  end

  def destroy
    @diet = @client.diets.find(params[:id])

    @diet.destroy

    redirect_to professionals_client_path(@client), notice: "Dieta removida com sucesso."
  end

  private

  def set_client
    @client = current_user.clients.find(params[:client_id])
  end
end
