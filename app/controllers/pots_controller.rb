class PotsController < ApplicationController

  def index
    @pots = Pot.all
  end

  def show
    @pot = Pot.find(params[:id])
  end

  def new
    @pot = Pot.new
  end

  def create
    @pot = Pot.new(pot_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def pot_params
    params.require(:pot).permit(:name, :description, :photo, :size, :adoption_date, :last_watering, :last_potting, :last_fertilizing, :last_cutting, :recipient_size, :user, :plant)
  end

end
