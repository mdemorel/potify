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
    if @pot.save
      redirect_to pot_path(@pot)
    else
      render :new
    end
  end

  def edit
    @pot = Pot.find(params[:id])
  end

  def update
    @pot = Pot.find(params[:id])
    @pot.update(pot_params)
    if @pot.save
      redirect_to pot_path(@pot)
    else
      render :new
    end
  end

  def destroy
    @pot = Pot.find(params[:id])
    @pot.destroy
  end

  private

  def pot_params
    params.require(:pot).permit(:name, :description, :photo, :size, :adoption_date, :last_watering, :last_potting, :last_fertilizing, :last_cutting, :recipient_size, :user, :plant)
  end

end
