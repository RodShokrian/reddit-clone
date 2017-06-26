class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :require_logged_in, :logged_in?

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_token
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logout!
    current_user.reset_token
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end
end

=begin
<% Sub.all.each do |sub| %>
<%= check_box "sub_ids[]", sub.id %>
<% end %>

=end
