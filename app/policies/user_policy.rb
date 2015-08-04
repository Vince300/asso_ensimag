class UserPolicy < ApplicationPolicy

  def edit?
    true # As current_user can edit the current_user, always
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
