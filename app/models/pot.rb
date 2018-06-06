class Pot < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :tasks, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true

  def needs?(task_name)
    (Date.today - send("last_#{task_name}")).to_i >= plant.send("#{task_name}_frequency")
  end

  def generate_tasks
    self.incomplete_task("watering")
    self.incomplete_task("potting")
    self.incomplete_task("fertilizing")
    self.incomplete_task("cutting")
  end

  def incomplete_task(task_name)
    return nil unless needs?(task_name)
    task = tasks.find_by(completed: false, name: task_name)
    points = Task::POINTS[task_name]
    task = Task.create(pot: self, name: task_name, points: points) if task.nil?
    return task
  end

  def sum_points
    pot_points = 0
    self.tasks.each do |task|
      pot_points += task.points if task.points && task.completed
    end
    return pot_points
  end

  def count_tasks_by_pot(task_name)
    tasks.where(completed: false).where(name: task_name).size
  end

  def next_task_date(task_name)
   next_task_date = send("last_#{task_name}") + plant.send("#{task_name}_frequency")
   if next_task_date < Date.today
     next_task_date = Date.today + plant.send("#{task_name}_frequency")
   end
   return next_task_date
  end
end
