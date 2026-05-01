module HomeHelper
  def dashboard_path_for(user)
    return unless user
    return admin_dashboard_path if user.admin?
    return clients_dashboard_path if user.client?
    professionals_dashboard_path if user.professional?
  end
end
