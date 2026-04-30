class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_on_onboarding, only: [ :show ]

  def show
  end

  def onboarding
  end

  def update_onboarding
    if current_user.update(user_params)
      respond_to do |format|
        format.html { redirect_to clients_dashboard_path, notice: "Perfil completo!" }
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

  def redirect_on_onboarding
    return unless user_signed_in?
    return if current_user.has_complete_info?

    redirect_to clients_dashboard_path, alert: "Complete seu perfil."
  end

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
