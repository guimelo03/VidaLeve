class Clients::OnboardingsController < Clients::BaseController
  def show
    return redirect_to clients_dashboard_path if current_user.has_complete_info?

    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to clients_dashboard_path, notice: "Perfil completo!"
    else
      render :show, status: :unprocessable_entity
    end
  end
end
