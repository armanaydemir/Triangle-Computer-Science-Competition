class TeamsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]
    before_action :team_leader_check, only: [:edit]
    
    
    def index
        @teams = Team.all
        if in_team
            @team = current_team
        end
    end

    def new
        @team = Team.new
    end
    
    def create
        tr = true
        @team = Team.new(team_params, points: 0)
        if @team.save
            @team_member = TeamMember.create(leader: tr, team_id: @team.id, user_id: session[:user_id] )
            if @team_member.save
                flash[:success] = "Now You Can Collaborate!"
                redirect_to User.find(session[:user_id])
            else
                render 'new'
            end
        else
            render 'new'
        end
    end
    
    def edit
        @team_member = TeamMember.find_by(user_id: session[:user_id])
        @team = Team.find(@team_member.team_id)
    end
    
    def update
        @team_member = TeamMember.find_by(user_id: session[:user_id])
        @team = Team.find(@team_member.team_id)
        if @team.update_attributes(team_params)
            flash[:success] = "Profile updated"
            redirect_to User.find(session[:user_id])
        else
            render 'edit'
        end
    end
    
    private 
        
        def team_params
            params.require(:team).permit(:name, :points, :password, :password_confirmation)
        end
        
        def logged_in_user
            unless logged_in?
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end
        
        def team_leader_check
            logged_in_user
            if TeamMember.find_by(user_id: session[:user_id])
                unless TeamMember.find_by(user_id: session[:user_id]).leader 
                    flash[:danger] = "You are not a Team Leader"
                    redirect_to User.find(session[:user_id])
                end
            else
                flash[:danger] = "You are part of a team"
                redirect_to User.find(session[:user_id])
            end
        end
    
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_url) unless current_user?(@user)
        end
end
