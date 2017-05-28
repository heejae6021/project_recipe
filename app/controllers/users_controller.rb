class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params) 
        if @user.save #회원가입 성공했을 때 
            login_url(@user)
            redirect_to new_ingredient_path
        else #회원가입 실패했을 때 
            render "new"
        end
    end
    
    def edit
        current_user.add_role :admin
        redirect_to root_path
    end
    
    private
    def user_params
        params.require(:user).permit(:nickname, :password, :password_confirmation)
    end

end
