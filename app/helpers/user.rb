helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def user
    if session[:user_id]
      @user ||= User.find_by_email(session[:email])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !user.nil?
  end
end