class PotsController < ApplicationController

  def index
    @pots = policy_scope(Pot)
  end

  def show
    @pot = Pot.find(params[:id])
    authorize @pot
  end

  def new
    @pot = Pot.new
    authorize @pot
  end

  def create
    @pot = Pot.new(pot_params)
    authorize @pot
    if @pot.save
      redirect_to pot_path(@pot)
    else
      render :new
    end
  end

  def edit
    @pot = Pot.find(params[:id])
    authorize @pot
  end

  def update
    @pot = Pot.find(params[:id])
    @pot.update(pot_params)
    authorize @pot
    if @pot.save
      redirect_to pot_path(@pot)
    else
      render :new
    end
  end

  def destroy
    @pot = Pot.find(params[:id])
    @pot.destroy
    authorize @pot
    redirect_to pots_path
  end

  private

  def pot_params
    params.require(:pot).permit(:name, :description, :photo, :size, :adoption_date, :last_watering, :last_potting, :last_fertilizing, :last_cutting, :recipient_size, :user, :plant)
  end

end