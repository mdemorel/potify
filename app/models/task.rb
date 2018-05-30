class Task < ApplicationRecord
  belongs_to :pot

  POINTS = {
    "watering" => 100,
    "fertilizing" => 50,
    "cutting" => 200,
    "potting" => 300
  }

  validates :name, inclusion: { in: POINTS.keys }

  def mark_as_completed!
    pot.send("last_#{name}=".to_sym, Date.today)
    pot.save
    self.points = POINTS[name]
    self.completed =
    save
  end
end
