class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    if user.present?
      can :create, Melange
      can [:read, :update, :destroy], Melange, participants: { role: :organizer, user: { id: user.id } }
      can [:read, :update], Melange, participants: { role: :moderator, user: { id: user.id } }
      can :read, Melange, participants: { role: :guest, user: { id: user.id } }
    end
  end
end
