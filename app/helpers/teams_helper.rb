module TeamsHelper
    
    def following?(f_team)
        Relationship.find_by(followed_id: f_team.id, follower_id: current_team.id)      
    end
end
