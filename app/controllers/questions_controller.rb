class QuestionsController < ApplicationController
  before_action :admin_user, except: [:show, :index]
  
  def new
    @question= Question.new
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new(q_params)
    if @question.save
      flash[:success] = "Thanks for Contributing"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @problem = Problem.find(params[:id])
    if @problem.update_attributes(q_params)
        flash[:success] = "Question Updated"
        redirect_to root_url
    else
        render 'edit'
    end
  end
  
  private

    def q_params
      params.require(:question).permit(:name, :description, :category, :difficulty, :score, :answer, :round_id, :num_points)
    end
    
    def admin_user
          unless current_user and current_user.admin
              redirect_to root_url
          end
    end
end
