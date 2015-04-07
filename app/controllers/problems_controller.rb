class ProblemsController < ApplicationController
    before_action :admin_user, except: [:new, :create]
    
    def new
        @problem = Problem.new
    end
    
    def show
        @problem = Problem.find(params[:id])
    end
    
    def create
        @problem = Problem.new(p_params)
        if @problem.save
            flash[:success] = "Thanks for Contributing"
            redirect_to root_url
        else
            render 'new'
        end 
    end
    
    def edit
        @problem = Problem.find(params[:id])
    end
    
    def update
        @problem = Problem.find(params[:id])
        if @problem.update_attributes(e_params)
            flash[:success] = "Problem Updated"
            redirect_to root_url
        else
            render 'edit'
        end
    end
    
    def destroy
        if Problem.find(params[:id]).destroy
            flash[:success] = "Profile deleted"
            redirect_to(root_url)
        end
    end
    
    private 
    
        def p_params
            params.require(:problem).permit(:name, :description, :category, :difficulty, :contributor)
        end
        
        def e_params
            params.require(:problem).permit(:name, :description, :category, :difficulty, :answer, :round_id, :num_points)
        end
        
        def admin_user
            unless current_user and current_user.admin
                redirect_to root_url
            end
        end
end
