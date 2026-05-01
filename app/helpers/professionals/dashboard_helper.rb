module Professionals::DashboardHelper
  def professional_saudation
    return unless current_user

    if current_user.professional?
      current_user.full_name.presence || current_user.email
    else
      current_user.email
    end
  end

  def completed_clients_profile
    current_user.clients.select(&:has_complete_info?).count
  end

  def professional_client_diets
    current_user.client_diets.count
  end
end
