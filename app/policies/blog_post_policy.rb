class BlogPostPolicy < ApplicationPolicy
  def create?
    not user.nil?
  end

  def update?
    can?
  end

  def destroy?
    can?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  protected
    def can?
      not user.nil? and user == record.author
    end
end
