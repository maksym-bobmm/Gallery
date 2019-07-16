class WelcomeController < ApplicationController
  def index
  end

  def signIn

  end

  def authentificate
    @user = User.new
    var = User.find_by(username: @user.username)
    if var
      redirect_to welcome_index_path
    else
      redirect_to welcome_authentificate_path
    end
  end
end
