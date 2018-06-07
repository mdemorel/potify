class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @best_users = User.includes(:pots).where.not(pots: []).order(points: :desc).limit(3)
    @pots = Pot.all
    @plants = Plant.all
  end

  def dashboard
    @user = current_user
    @pots = Pot.where(user: current_user)
    @users = User.all
  end
end
