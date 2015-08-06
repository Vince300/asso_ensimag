class UserPolicy < ApplicationPolicy

  def edit?
    not user.nil? # As current_user can edit the current_user, always
  end

  def update?
    not user.nil? # See above
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
