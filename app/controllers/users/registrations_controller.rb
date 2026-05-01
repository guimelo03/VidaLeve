class Users::RegistrationsController < Devise::RegistrationsController
  def new_professional
    self.resource = resource_class.new
    render :new_professional
  end

  def create_professional
    user = User.new(sign_up_params)

    user.role = :professional

    if user.save
      sign_in(:user, user)

      redirect_to professionals_dashboard_path,
        notice: "Conta criada com sucesso."
    else
      flash.now[:alert] = "Não foi possível criar a conta."

      render :new_professional, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :full_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
