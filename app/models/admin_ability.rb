class AdminAbility
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new
    if user.admin?
      can :manage, :all
    end
  end
end
