class SessionsController < ApplicationController
  skip_before_action :authorize_user
  skip_before_action :authorize_admin
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    @user = user
    if user and user.authenticate(params[:password])
        session[:user_id] = user.id
        if user.role == 'user_admin'
          session[:role] = 'user_admin'
        else
          session[:role] = 'user'
        end
        redirect_to user_url(user.id)
    else
        redirect_to login_url, alert:"Invalid username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:role] = nil
    redirect_to login_url, alert: "Successfully logged out"
  end
end
