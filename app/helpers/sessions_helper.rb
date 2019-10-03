module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def log_in?
    session[:user_id].present?
  end
end
