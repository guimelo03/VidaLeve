class Clients::ProfilesController < Clients::BaseController
  before_action :require_complete_profile!, only: [ :edit, :update ]
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to clients_profile_path, notice: "Perfil atualizado com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
