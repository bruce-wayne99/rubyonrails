class WelcomeController < ApplicationController
  skip_before_action :authorize_user
  skip_before_action :authorize_admin
  def index
  end
end
