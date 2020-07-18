module ApplicationHelper
  
  def navigation
    if logged_in?
      render partial: 'layouts/login_navigation'
    else
      render partial: 'layouts/logout_navigation'
    end
  end

end
