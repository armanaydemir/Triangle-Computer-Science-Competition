class JoinerController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]
    
    def new
    end

    def create
        tr = false
        team = Team.find_by(name: params[:joiner][:name])
        if team && team.authenticate(params[:joiner][:password])
            team_member = TeamMember.create(leader: tr, team_id: team.id, user_id: current_user.id )
            team_member.save
            redirect_to current_user
        elsif team
            flash.now[:danger] = 'Invalid Password'
            render 'new'
        else
            flash.now[:danger] = 'Invalid Team Name'
            render 'new'
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
end
