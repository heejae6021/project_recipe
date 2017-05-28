class SessionsController < ApplicationController
  
def new
end




def create
    user = User.find_by(nickname: params[:nickname]) 
  if user && user.authenticate(params[:password])
      #로그인이 성공했을 때
      session[:user_id] = user.id 
      redirect_to new_ingredient_path
  else
      #로그인이 실패했을 때
      flash[:alert] = '당신의 닉네임 또는 비밀번호가 잘못되었습니다'
      render 'new' 
  end
end

def destroy
  session.delete(:user_id)
  @current_user = nil
  redirect_to root_path
end


end