class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user,post)
    @user=user
    @post=post
  end

  def admin_list?
    user.admin?
  end
  
  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
  
end
