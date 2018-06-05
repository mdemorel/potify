class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pots, dependent: :destroy

  def count_points
    user_points = 0
    self.pots.each do |pot|
      user_points += pot.sum_points
    end
    return user_points
  end

  def count_tasks
    user_tasks = 0
    self.pots.each do |pot|
      user_tasks += pot.tasks.where(completed: false).size
    end
    return user_tasks
  end

  # def points(number)
  #   return number
  # end
end
