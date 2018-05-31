class PotsController < ApplicationController

  def index
    @pots = policy_scope(Pot)
  end

  def show
    @pot = Pot.find(params[:id])
    authorize(@pot)

    if Date.today - @pot.last_watering >= @pot.plant.watering_frequency
      @watering = @pot.tasks.find_by(completed: false, name: "watering")
      Task.create(pot: @pot, name: "watering")if @watering.nil?
    end

    if Date.today - @pot.last_cutting >= @pot.plant.cutting_frequency
      @cutting = @pot.tasks.find_by(completed: false, name: "cutting")
      @cutting = Task.create(pot: @pot, name: "cutting") if @cutting.nil?
    end

    if Date.today - @pot.last_potting >= @pot.plant.potting_frequency
      @potting = @pot.tasks.find_by(completed: false, name: "potting")
      @potting = Task.create(pot: @pot, name: "potting") if @potting.nil?
    end

    if Date.today - @pot.last_fertilizing >= @pot.plant.fertilizer_frequency
      @fertilizing = @pot.tasks.find_by(completed: false, name: "fertilizing")
      @fertilizing = Task.create(pot: @pot, name: "fertilizing") if @fertilizing.nil?
    end
  end

  def new
    @pot = Pot.new
    authorize(@pot)
  end

  def create
    @pot = Pot.new(pot_params)
    if @pot.photo.empty?
      @pot.photo = @pot.plant.photo
    end
    @pot.user = current_user
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
    authorize(@pot)
    redirect_to pots_path
  end

  private

  def pot_params
    params.require(:pot).permit(:name, :description, :photo, :size, :adoption_date, :last_watering, :last_potting, :last_fertilizing, :last_cutting, :recipient_size, :plant_id)
  end

end
