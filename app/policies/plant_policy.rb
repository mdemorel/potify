class PlantPolicy < ApplicationPolicy
   class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def edit?
    return true
  end

  def update?
    user.admin = true
  end
end
