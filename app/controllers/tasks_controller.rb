class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

  end

  def update
    @task = Task.find(params[:id])
    authorize(@task)
    @task.update(task_params)
    if @task.name == "watering"
      @task.pot.update(last_watering: Date.today)
      @task.points = 100
      if @task.save
          respond_to do |format|
          format.html { redirect_to pot_path(@task.pot_id)}
          format.js
        end
      else
        respond_to do |format|
          format.html {render 'pots/show'}
          format.js
        end
      end
    end

    if @task.name == "fertilizing"
      @task.pot.update(last_fertilizing: Date.today)
      @task.points = 50
      if @task.save
        respond_to do |format|
          format.html { redirect_to pot_path(@task.pot_id)}
          format.js
        end
      else
        respond_to do |format|
          format.html {render 'pots/show'}
          format.js
        end
      end
    end
    if @task.name == "cutting"
      @task.pot.update(last_cutting: Date.today)
      @task.points = 200
      if @task.save
        respond_to do |format|
          format.html { redirect_to pot_path(@task.pot_id)}
          format.js
        end
      else
        respond_to do |format|
          format.html {render 'pots/show'}
          format.js
        end
      end
    end
    if @task.name == "potting"
      @task.pot.update(last_potting: Date.today)
      @task.points = 300
      if @task.save
        respond_to do |format|
          format.html { redirect_to pot_path(@task.pot_id)}
          format.js
        end
      else
        respond_to do |format|
          format.html {render 'pots/show'}
          format.js
        end
      end
    end
  end

  def destroy

  end

  private

  def task_params
    params.require(:task).permit(:name, :completed, :points, :pot_id)
  end
end
