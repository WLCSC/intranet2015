class ApplicationController < ActionController::Base
  before_action :expiration
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def expiration
    @notes_stuff = Note.all
  end
end
