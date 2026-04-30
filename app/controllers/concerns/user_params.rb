module UserParams
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
