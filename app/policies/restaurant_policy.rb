class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if @user.admin
        scope.all
      else
        scope.where(user: @user)
      end
      # Restaurant.where(xw: true)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    owner?
  end

  def edit?
    update?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    @record.user == @user
  end
end
