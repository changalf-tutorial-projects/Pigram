class RelationshipsController < ApplicationController
  def follow_user
    @user = User.find_by!(username: params[:username])
    if current_user.follow_user(@user.id)
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    end
  end

  def unfollow_user
    @user = User.find_by!(username: params[:username])
    if current_user.unfollow_user(@user.id)
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    end
  end
end
