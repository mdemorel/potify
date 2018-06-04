class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @pots = Pot.all
    @plants = Plant.all
  end

  def dashboard
    @user = current_user
    @pots = Pot.where(user: current_user)
    @users = User.all
  end
end
