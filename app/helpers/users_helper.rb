module UsersHelper
  def client_saudation
    return unless current_user

    if current_user.client?
      current_user.full_name.presence || current_user.email
    else
      current_user.email
    end
  end
end
