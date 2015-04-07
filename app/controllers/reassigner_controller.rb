class ReassignerController < ApplicationController
    before_action :team_leader, only: [:new, :create]
    
    def new
        @user = User.find(session[:user_id])
        @team_member = TeamMember.find_by(user_id: session[:user_id])
        @team = Team.find(@team_member.team_id)
        @team_mates = TeamMember.where(team_id: @team.id)
    end
    
    def create
        TeamMember.find_by(user_id: re_params[:change_id]).update_attribute(:leader, true) 
        TeamMember.find_by(user_id: session[:user_id]).update_attribute(:leader, false ) 
        redirect_to User.find(session[:user_id])
    end
    
    
    private
    
    
    def re_params
      params.permit(:change_id)
    end
    
    
    def team_leader
            @team_member = TeamMember.find_by(user_id: session[:user_id])
            unless @team_member and @team_member.leader
                flash[:danger] = 'You must be a team leader to reach this page'
                redirect_to(User.find(session[:user_id]))
            end
    end
end
