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

  def new_professional
    self.resource = resource_class.new
    render "devise/sessions/new_professional"
  end

  def create_professional
    user = User.find_by(email: params[:email].to_s.downcase.strip)

    if user&.valid_password?(params[:password]) && user.professional?
      sign_in(:user, user)

      redirect_to professionals_dashboard_path
    else
      flash.now[:alert] = "Email ou senha inválidos"

      render "devise/sessions/new_professional", status: :unprocessable_entity
    end
  end
end
