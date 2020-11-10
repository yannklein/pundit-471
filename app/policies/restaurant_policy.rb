class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Restaurant.all
    end
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   true
  # end

  def update?
    # true
    # if the restaurant belongs to
    # current user true else false
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    record.user == user || user.admin?
  end
end
