# frozen_string_literal: true

class WelcomeController < ApplicationController
  # before_action :authenticate_user!

  def index; end

  # def authentificate
  #   @welcome = User.new(username: params[:username])
  #   var = User.find_by(username: @welcome.username) if @welcome.username
  #   # raise StandartError
  #   if var
  #     redirect_to welcome_index_path
  #   # else
  #   #   redirect_to welcome_authentificate_path
  #   end
  # end
end
