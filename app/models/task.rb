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
    # pot.user.points += self.points
    # updates the completed status
    self.completed = true
    save
  end

  def action_name
    action = ""
    if name == "watering"
      action = "water"
    elsif name == "potting"
      action = "pot"
    elsif name == "cutting"
      action = "cut"
    elsif name == "fertilizing"
      action = "fertilize"
    end
  end

end
