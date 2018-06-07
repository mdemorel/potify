class PotsController < ApplicationController
  def index
    @pots = policy_scope(Pot)
  end

  def show
    @pot = Pot.find(params[:id])
    @pot.generate_tasks
    authorize(@pot)
  end

  def new
    @pot = Pot.new
    authorize(@pot)
  end

  def create
    @plant = Plant.find(params[:pot][:plant_id])
    @pot = Pot.new(pot_params)
    @pot.user = current_user
    @pot.last_watering = Date.today - @plant.watering_frequency.day
    @pot.last_cutting = Date.today - @plant.cutting_frequency.day
    @pot.last_potting = Date.today - @plant.potting_frequency.day
    @pot.last_fertilizing = Date.today - @plant.fertilizing_frequency.day
    authorize(@pot)
    if @pot.save
      redirect_to pot_path(@pot)
    else
      render :new
    end
  end

  def edit
    @pot = Pot.find(params[:id])
    authorize(@pot)
  end

  def update
    @pot = Pot.find(params[:id])
    @pot.update(pot_params)
    authorize(@pot)
    if @pot.save
      redirect_to pot_path(@pot)
    else
      render :new
    end
  end

  def destroy
    @pot = Pot.find(params[:id])
    @pot.destroy
    @pot.user.points -= 2000
    @pot.user.save
    authorize(@pot)
    redirect_to dashboard_path
  end



  private

  def pot_params
    params.require(:pot).permit(:name, :description, :photo, :size, :adoption_date, :last_watering, :last_potting, :last_fertilizing, :last_cutting, :recipient_size, :plant_id)
  end

end
