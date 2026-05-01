class Users::SessionsController < Devise::SessionsController
  before_action :logout_non_clients_from_client_login, only: [ :new, :create ]

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

  def create
    user = User.find_by(
      email: params[:user][:email].to_s.downcase.strip
    )

    if user&.valid_password?(params[:user][:password]) &&
      user.client?

      sign_in(:user, user)

      redirect_to clients_dashboard_path

    else
      flash.now[:alert] = "Email ou senha inválidos"

      self.resource = resource_class.new(sign_in_params)

      render :new, status: :unprocessable_entity
    end
  end

  private

  def logout_non_clients_from_client_login
    return unless current_user.present?
    return if current_user.client?

    sign_out(current_user)

    flash[:alert] = "Email ou senha inválidos"

    redirect_to login_path
  end
end
