class TeamMemberController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]
    before_action :correct_user, only: :destroy
    
    def new 
        @team_member = TeamMember.new
    end
    
    def create
        @team_member = TeamMember.new
    end
    
    def show
        @team_member = TeamMember.find(params[:id])
    end
    
    def destroy
        @team_member = TeamMember.find(params[:id])
        @team = Team.find(@team_member.team_id)
        @team_mates = TeamMember.where(team_id: @team.id)
        if @team_mates.length == 1 or @team_mates.length == 0
            TeamMember.find(params[:id]).destroy
            Team.find(@team_member.team_id).destroy
        elsif not @team_member.leader
            TeamMember.find(params[:id]).destroy
        else 
            flash[:danger] = 'You must reassign the Team Leader in order to leave'
        end
        redirect_to(User.find(session[:user_id]))
    end
    
    private
    
        def correct_user
            @user = User.find(TeamMember.find(params[:id]).user_id)
            redirect_to(root_url) unless current_user?(@user)
        end
        
        def team_leader
            @team_member = TeamMember.find(params[:id])
            unless not @team_member and  not @team_member.leader
                flash[:danger] = 'You must be a team leader to reach this page'
                redirect_to(User.find(session[:user_id]))
            end
        end
    
end
