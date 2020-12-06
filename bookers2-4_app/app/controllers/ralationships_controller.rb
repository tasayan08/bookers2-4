class RalationshipsController < ApplicationController
 
 def follow
  current_user.follow(params[:id])
  redirect_to request.referer
 end
 
 def unfollow
  current_user.unfollow(params[:id])
  redirect_to request.referer
 end
 
 def show
  @user = User.find(params[:id])
 end

    
    
    
    
    
    
    # before_action :set_user
    
    # def create
    #  following = current_user.follow(@user)
    #   if following.save
    #      flash[:success] = 'ユーザーをフォローしました'
    #      redirecrt_to @user
    #   else
    #      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    #      redirecrt_to @user
    #   end
    # end
    
    # def destroy
    #   following = current_user.unfollow(@user)
    #   if following.destroy
    #       flash[:success] = 'ユーザーのフォローを解除しました。'
    #       redirecrt_to @user
    #   else
    #       flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    #       redirecrt_to @user
    #   end      
    # end 
    
    
    # private
     
    #  @user = User.find params[:follow_id]
  
    
end
