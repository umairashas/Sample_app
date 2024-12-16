# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
   if user.present?
      can :manage, Todo, user_id: user.id
    end# https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
