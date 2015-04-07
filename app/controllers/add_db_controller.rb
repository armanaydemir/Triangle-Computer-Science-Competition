class AddDbController < ApplicationController
    before_action :admin_user
    
    def new
        @optionMakers = Problem.all
    end
    
    def create
        @problem = Problem.find(db_params[:db_id])
        @question = Question.new(name: @problem.name, description: @problem.description, category: @problem.category,
            difficulty: @problem.difficulty, answer: @problem.answer,
            round_id: @problem.round_id, num_points: @problem.num_points)
        if @question.save
            Problem.find(db_params[:db_id]).destroy
            redirect_to root_url
        else
            redirect_to 'edit'
        end
    end
    
    private
    
        def db_params
            params.permit(:db_id)
        end
    
        def admin_user
            unless current_user and current_user.admin
                redirect_to root_url
            end
        end
    
end
