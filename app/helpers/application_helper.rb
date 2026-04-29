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

    "shared/navbars/client"
  end

  def render_navbar
    render navbar_partial
  end
end
