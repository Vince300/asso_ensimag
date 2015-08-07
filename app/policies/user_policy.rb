class UserPolicy < ApplicationPolicy
  def detail?
    true
  end

  def update?
    not user.nil? and user == record
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
