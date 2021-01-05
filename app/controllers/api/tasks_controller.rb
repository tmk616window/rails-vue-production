class Api::TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])
        # @protags = Protag.all
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        head :no_content
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        render :show, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @task = Task.find(params[:id])
      if @task.destroy
        head :no_content
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
    
    private
    
    
    def task_params
       params.require(:task).permit(:name, :user_id)
    end
    
    
    
    
  end