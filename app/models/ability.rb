class Ability
  include CanCan::Ability

  def initialize(user)
    unless user
      can :read, Post, status: "active"
    else
      if user.admin?
        can :manage, :all
        can :access, :rails_admin
        can :dashboard
      else
        can :read, Post, status: "active"
      end

      if user.moderator?
        can :manage, Post
      else
        can :read, Post, status: "active"
      end

      if user.user?
        can [:update, :destroy], Post, user_id: user.id, status: "active"
        can :read, Post, user_id: user.id, status: "deactivate"
        can :create, Post
        can [:read], User, :id => user.id
      else
        can :read, Post, status: "active"
      end

    end
  end

end
