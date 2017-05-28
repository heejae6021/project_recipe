class Ability
  
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #user-> current_user
    
    user ||= User.new # guest user (not logged in)
      if user.has_role? :admin 
        #어드민 권한 
        can :manage, :all
      else
        #소시민 권한 
        can :read, :all
        can :new, :all
        can :create, :all 
        can :manage, Ingredient, user_id: user.id
      end
  end

end
