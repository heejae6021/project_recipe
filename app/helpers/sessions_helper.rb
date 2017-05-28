module SessionsHelper
    def login_url(user)
        session[:user_id] = user.id
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    # def current_user
    #     if @current_user.nil
    #         @current_user = User.find_by(id: session[:user_id])
    #     else
    #         @current_user = @current_user
    #     end
    # end

end