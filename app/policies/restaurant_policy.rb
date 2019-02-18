class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #Scope become the object sent via
        #policy_scope(argument)
          #in this case, scope = Restaurant
      #to index all restaurants we do
        scope.all

      #to filter for your own restaurants
        #scope.where(user: user)
    end
  end

  # user in pundit = current_user
  # record in pudit = authorize @restaurant (instance you are authurizing. AKA: a restaurant object)

  # def new?
  #   #everyone can create
  #   true
  # end

  def create?
    #everyone who is loggedin can do this action
    true
  end

  def show?
    #everyone who is loggedin can do this action
    true
  end

  def edit?
    #same as
    #@restaurant.user == current_user (but with pundit variables)
    user_owner? || user.admin
  end

  def update?
    user_owner? || user.admin
  end

  def destroy?
    user_owner? || user.admin
  end

  private

  def user_owner?
    record.user == user
  end


end
