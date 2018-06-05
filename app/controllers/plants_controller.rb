class PlantsController < ApplicationController

  def index
    if params[:query].present?
      @plants = policy_scope(Plant).order(created_at: :desc).where("name ILIKE ?", "%#{params[:query]}%")
    else
      @plants = policy_scope(Plant).order(created_at: :desc)
    end
  end

  def show
    @plant = Plant.find(params[:id])
    authorize(@plant)
  end

  def edit
    @plant = Plant.find(params[:id])
    authorize(@plant)
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    authorize(@plant)
    redirect_to plant_path(@plant)
  end

  private

  def plant_params
    params.require(:plant).permit(:category, :description, :watering_frequency, :watering_quantity, :potting_frequency, :fertilizing_quantity, :fertilizing_frequency, :fertilizing_type, :exposition, :cutting_frequency, :temperature)
  end



end
