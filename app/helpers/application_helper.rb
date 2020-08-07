module ApplicationHelper
  
  def navigation
    if logged_in?
      render partial: 'layouts/login_navigation'
    end
  end

  def alert_class(flash_type)
    case flash_type.to_sym
    when :notice
      "alert-success"
    when :alert
      "alert-warning"
    when :error
      "alert-danger"
    end
  end

end
