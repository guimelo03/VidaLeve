class Users::SessionsController < Devise::SessionsController
  def new_admin
    self.resource = resource_class.new
    render :new_admin
  end

  def create_admin
    user = User.find_by(email: params[:email].to_s.downcase.strip)

    if user&.valid_password?(params[:password]) && user.admin?
      sign_in(:user, user)
      redirect_to admin_dashboard_path
    else
      flash.now[:alert] = "Email ou senha inválidos"
      render :new_admin, status: :unprocessable_entity
    end
  end
end
