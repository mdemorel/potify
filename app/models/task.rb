class Task < ApplicationRecord
  belongs_to :pot

  POINTS = {
    "watering" => 100,
    "fertilizing" => 50,
    "cutting" => 200,
    "potting" => 300
  }

  TASKS = POINTS.keys

  validates :name, inclusion: { in: POINTS.keys }

  def mark_as_completed!
    # updates the last_task of the pot
    pot.send("last_#{name}=".to_sym, Date.today)
    pot.save
    # updates the points of the task
    self.points = POINTS[name]
    # updates the completed status
    self.completed = true
    save
  end

end
