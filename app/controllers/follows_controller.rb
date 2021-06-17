class FollowsController < ApplicationController
    def create
        user = User.find(params[:user_id])
        follow = Follow.new(user_id: current_user.id, following_id: user.id)
        follow.save
        redirect_to user_path(user)
    end

    def destroy
        user = User.find(params[:user_id])
        follow = Follow.where(following_id: user.id, user_id: current_user.id).first
        follow.destroy
        redirect_to user_path(user)
    end

    def follower_users
        @user = User.find(params[:user_id])
        @followers = @user.followers.paginate(page: params[:page])
    end

    def following_users
        @user = User.find(params[:user_id])
        @followings = @user.following.paginate(page: params[:page])
    end
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end