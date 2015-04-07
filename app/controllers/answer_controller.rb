class AnswerController < ApplicationController
    before_action :logged_in_team_member
    
    def new
    end
    
    def create
        @question = Question.find(params[:id_q])
        v = TeamsQuestion.find_by(question_id: @question.id,
        team_id: Team.find(TeamMember.find_by(user_id: current_user.id)).id)
        if v
            if params[:submission] == @question.answer
                flash.now[:success] = 'Nice Job!'
                v.correct = true
            end
            v.attempts += 1
        else
            TeamsQuestion.create(question_id: @question.id, team_id: Team.find(TeamMember.find_by(user_id: current_user.id)).id, attempts: 1, correct: params[:submission] == @question.answer)
            if params[:submission] == @question.answer
                flash.now[:success] = 'Nice Job! And on the first try!'
            end
        end
        redirect_to root_url
    end

    
    
    
    private
    
        def logged_in_team_member #finish this
            unless logged_in? && TeamMember.find_by(user_id: session[:user_id])
                flash[:danger] = "You must be on a team in order to answer"
                redirect_to root_url
            end
        end
        
        def answer_params
            params.require(:answer).(:submission, :id_q)
        end
end
