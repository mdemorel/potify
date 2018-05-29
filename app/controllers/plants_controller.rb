class PlantsController < ApplicationController

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def show
    @plant = Plant.find(params[:id])
  end

end
