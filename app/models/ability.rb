# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #

    user ||= User.new #guest user

    # can :read, Post #all users (not logged in included) can read all posts

    # return unless user.publisher?

    # can %i[create read update destroy], Post, user: user

    # return unless user.admin?

    # can :manage, :all

    if user.admin?
      can :manage, :all
    elsif user.publisher?
      can :read, Post
      can :create, Post
      can :update, Post, user: user
      # can :update, Post do |post|
      #   post.try(:user) == user
      # end
      can :destroy, Post, user: user
      can :manage, Comment, post: { user_id: user.id }
      can %i[read create], Comment, :post
    elsif user.standard?
      can :read, Post
      can %i[read create], Comment, :post
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published Posts.
    #
    #   can :update, Post, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
