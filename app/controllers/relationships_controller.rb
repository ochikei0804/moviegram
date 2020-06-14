class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    redirect_to user, notice: 'ユーザーをフォローしました。'
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    redirect_to user, notice: 'ユーザーのフォローを解除しました。'
  end
end