class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  
  # def current_user
  #   if @current_user.nil
  #       @current_user = User.find_by(id: session[:user_id])
  #   else
  #       @current_user = @current_user
  #   end
  # end
  
  helper_method :current_user
  
  def authorize
    if current_user.nil?
      redirect_to login_url
    elsif current_user != Ingredient.find(params[:id]).user
      redirect_to root_url
    end
  end

end
