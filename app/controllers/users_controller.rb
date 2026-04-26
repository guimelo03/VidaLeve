class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end
  def onboarding
  end

  def update_onboarding
    if current_user.update(user_params)
      respond_to do |format|
        format.html { redirect_to client_dashboard_path, notice: "Perfil completo!" }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { render :onboarding }
        format.json { render json: { errors: current_user.errors }, status: :unprocessable_entity }
      end
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
