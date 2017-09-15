class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize_user
  before_action :authorize_admin
  protected
  def authorize_user
    unless User.find_by(id: session[:user_id])
        redirect_to login_url, alert:"You are trying to access without permission?"
    end
  end

  def authorize_admin
    unless User.find_by(id: session[:user_id]) and User.find_by(id: session[:user_id]).role == 'user_admin'
      redirect_to login_url, alert:"You are trying to access without permission?"
    end
  end

end
