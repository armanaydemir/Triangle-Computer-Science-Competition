class RelationshipsController < ApplicationController
    before_action :logged_in_user

  def create
    team = Team.find(params[:followed_id])
    current_team.follow(team)
    respond_to do |format|
      format.html { redirect_to Team }
      format.js
    end
  end

  def destroy
    team = Relationship.find(params[:id]).followed
    current_team.unfollow(team)
    respond_to do |format|
      format.html { redirect_to Team }
      format.js
    end
  end
  
  private 
  
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end