class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pots, dependent: :destroy

  # def count_points
  #   user_points = 0
  #   self.pots.each do |pot|
  #     user_points += pot.sum_points
  #   end
  #   return user_points
  # end

  STATUS = {
    "Baby Seeder" => [0...1000],
    "Aspiring gardener" => [1000...2000],
    "Garden Hero" => [2000...3000],
    "Plant wizard" => [3000...100000]
  }

  def count_tasks
    user_tasks = 0
    self.pots.each do |pot|
      user_tasks += pot.tasks.where(completed: false).size
    end
    return user_tasks
  end

  def count_tasks_by_name(task_name)
    user_tasks = 0
    self.pots.each do |pot|
      user_tasks += pot.tasks.where(completed: false).where(name: task_name).size
    end
    return user_tasks
  end

  def status
    status = ""
    if points < 1000
      status = "Baby seeder"
    elsif points < 2000
      status = "Aspiring gardener"
    elsif points < 3000
      status = "Garen Hero"
    else
      status = "Plant wizard"
    end
  end

  # def points(number)
  #   return number
  # end
end
