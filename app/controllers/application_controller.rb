class ApplicationController < ActionController::Base
  before_action :expiration
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def internal_request?
    remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    remote_ip =~ /10\..+/
  end

  def current_user
	if APP_CONFIG[:ignore_ldap]
		@current_user = DummyUser.new
	else
		@current_user ||= (session[:udn] ? User.find(session[:udn]) : nil) 
	end
  end

  def current_admin
    @current_admin ||= (current_user && current_user.admin?)
  end

  def expiration
    @notes_stuff = Note.all
  end

  helper_method :current_user, :current_admin

  private
  def check_for_user
    redirect_to root_path, alert: "Please log in." unless APP_CONFIG[:ignore_ldap] || current_user
  end

  def check_for_admin
    redirect_to root_path, alert: "You can't do that" unless APP_CONFIG[:ignore_ldap] || current_admin
  end
end
