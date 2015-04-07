class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :join, :create_team]
  before_action :correct_user, only: [:show, :join, :update, :delete]
  before_action :team_leader, only: [:reassign, :reassigned]

  
  def new
    @user = User.new
  end
  
  def show
    @user = current_user
    @questions = Question.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for signing up!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @team_member = TeamMember.find(params[:id])
    if @team_member
      flash[:danger] = "You must leave your team in order to be able to delete your account"
      redirect_to User.find(params[:id])
    else
      User.find(params[:id]).destroy
      flash[:success] = "Profile deleted"
      redirect_to(root_url)
    end
  end
  
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :user_name, :email, :age, :password, 
                                   :password_confirmation)
    end
    
    def team_params
      params.require(:team).permit(:name, :school, :password, :password_confirmation)
    end
    
    
        
      
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def team_leader
            @team_member = TeamMember.find_by(user_id: session[:user_id])
            unless @team_member and @team_member.leader
                flash[:danger] = 'You must be a team leader to reach this page'
                redirect_to(User.find(session[:user_id]))
            end
    end
    
end