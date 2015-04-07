module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def current_team
        if in_team
            @current_team ||= Team.find(TeamMember.find_by(user_id: current_user.id).team_id)
        end
    end
    
    def in_team
        if TeamMember.find_by(user_id: current_user.id) == nil
            return false
        end
        return true
    end
        
    
    
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    def current_user?(user)
        user == current_user
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
