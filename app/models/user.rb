class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pots, dependent: :destroy
  has_many :tasks, through: :pots

  # def count_points
  #   user_points = 0
  #   self.pots.each do |pot|
  #     user_points += pot.sum_points
  #   end
  #   return user_points
  # end

  STATUS = {
    "Baby Seeder" => 0,
    "Aspiring Gardener" => 4000,
    "Garden Hero" => 8000,
    "Plant Wizard" => 15000
  }

  # def count_tasks
  #   user_tasks = 0
  #   self.pots.each do |pot|
  #     user_tasks += pot.tasks.where(completed: false).size
  #   end
  #   return user_tasks
  # end

  # def count_all_tasks
  #   all_tasks = 0
  #   pots.each do |pot|
  #     all_tasks += pot.tasks.size
  #   end
  #   return all_tasks
  # end

  # def count_tasks_by_name(task_name)
  #   user_tasks = 0
  #   self.pots.each do |pot|
  #     user_tasks += pot.tasks.where(completed: false).where(name: task_name).size
  #   end
  #   return user_tasks
  # end

  def status
    status = ""
    if points < 4000
      status = "Baby Seeder"
    elsif points < 8000
      status = "Aspiring Gardener"
    elsif points < 15000
      status = "Garden Hero"
    else
      status = "Plant Wizard"
    end
  end

  def is_master
    status == User::STATUS.keys.last
  end

  def next_status
    current_status_index = User::STATUS.keys.find_index(User.find(self.id).status)
    User::STATUS.keys[current_status_index + 1]
  end

  def left_for_next_status
    points_needed = User::STATUS[next_status]
    points_needed - points
  end

  # def points(number)
  #   return number
  # end
end
