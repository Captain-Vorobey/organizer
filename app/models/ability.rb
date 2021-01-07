# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :customer
      can :read, :all
    elsif user.has_role? :owner
      can :crud, Service, Company
    end
  end
end
