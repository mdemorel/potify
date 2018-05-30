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

end
