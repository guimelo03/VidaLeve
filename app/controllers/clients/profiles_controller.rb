class Clients::ProfilesController < Clients::BaseController
  before_action :authenticate_user!

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

  private

  def user_params
    params.require(:user).permit(
      :full_name,
      :age,
      :phone,
      :sex,
      :city,
      :state,
      :profession,
      :work_routine,
      :current_weight,
      :height,
      :abdominal_circumference,
      :measured_with_tape,
      :measurement_notes,
      :main_goal,
      :main_discomfort
    )
  end
end
