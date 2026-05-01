module ApplicationHelper
  def flash_class(type)
    case type.to_sym
    when :notice then "alert-success"
    when :alert then "alert-danger"
    else "alert-secondary"
    end
  end

  def navbar_partial
    return "shared/navbars/home" if current_page?(root_path) || !user_signed_in?
    return "shared/navbars/admin" if current_user&.admin?
    return "shared/navbars/professional" if current_user&.professional?

    "shared/navbars/client"
  end

  def render_navbar
    render navbar_partial
  end

  def format_phone(phone)
    return "" if phone.blank?

    if phone.length == 11
      phone.gsub(/(\d{2})(\d{5})(\d{4})/, '(\1) \2-\3')
    else
      phone.gsub(/(\d{2})(\d{4})(\d{4})/, '(\1) \2-\3')
    end
  end

  def diet_back_path(user)
    if current_user.admin?
      admin_user_path(user)
    elsif current_user.professional?
      professionals_client_path(user)
    end
  end

  def edit_diet_path(user, diet)
    if current_user.admin?
      edit_admin_user_diet_path(user, diet)
    elsif current_user.professional?
      edit_professionals_client_diet_path(user, diet)
    end
  end

  def diet_path(user, diet)
    if current_user.admin?
      admin_user_diet_path(user, diet)
    elsif current_user.professional?
      professionals_client_diet_path(user, diet)
    end
  end

  def diets_path_for(user)
    if current_user.admin?
      admin_user_diets_path(user)
    elsif current_user.professional?
      professionals_client_diets_path(user)
    end
  end

  def destroy_diet_path(user, diet)
    if current_user.admin?
      admin_user_diet_path(user, diet)
    elsif current_user.professional?
      professionals_client_diet_path(user, diet)
    end
  end
end
