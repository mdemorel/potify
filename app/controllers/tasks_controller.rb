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
    redirect_to pot_path(@task.pot)
  end

  def destroy

  end

  private

  def task_params
    params.require(:task).permit(:name, :completed, :points, :pot_id)
  end
end
