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
    @task.mark_as_completed!
    @user = current_user
    @pots = Pot.all
    @pot = @task.pot
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

  def destroy

  end

  private

  def task_params
    params.require(:task).permit(:name, :completed, :points, :pot_id)
  end
end
