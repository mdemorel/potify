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
end
