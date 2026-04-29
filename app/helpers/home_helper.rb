module HomeHelper
  def dashboard_path_for(user)
    return unless user
    return admin_dashboard_path if user.admin?
    clients_dashboard_path if user.client?
  end
end
