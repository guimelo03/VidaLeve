class UsersController < ApplicationController
  before_action :authenticate_user!
  def onboarding
  end

  def update_onboarding
    if current_user.update(user_params)
      redirect_to client_dashboard_path, notice: "Informações atualizadas!"
    else
      render :onboarding
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :full_name,
      :age,
      :sex,
      :city,
      :state,
      :profession,
      :work_routine,
      :current_weight,
      :height,
      :abdominal_circunference,
      :measured_with_tape,
      :measurement_notes,
      :main_goal,
      :main_discomfort
    )
  end
end
