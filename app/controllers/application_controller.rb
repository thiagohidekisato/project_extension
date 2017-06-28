class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
    # Confirms a logged-in user.
    def logged_in_professor
      unless logged_in?
        flash[:danger] = "Por favor, realize o login."
        redirect_to login_url
      end
    end
end