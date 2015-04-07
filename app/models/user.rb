class User < ActiveRecord::Base
    has_one :team_member, dependent: :destroy
    
    
    
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    validates :user_name, presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
                    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
                    
    validates :age, numericality: {:only_integer => true}
                    
    has_secure_password
    validates :password, length: { minimum: 3 }, allow_blank: true
                            
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
      # Follows a user.
      def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
      end
    
      # Unfollows a user.
      def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
      end
    
      # Returns true if the current user is following the other user.
      def following?(other_user)
        following.include?(other_user)
      end
end
