class UserPolicy < ApplicationPolicy

  def edit?
    base?
  end

  def update?
    base?
  end

  def base?
    not user.nil? and user == record
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
