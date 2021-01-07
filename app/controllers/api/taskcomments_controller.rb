class Api::TaskcommentsController < ApplicationController
  def index
    @taskcomments = Taskcomment.where(params[:task_id])
  end
  
  def show
    @taskcomment = Taskcomment.where(task_id: params[:id])
  end

  def create
    @taskcomment = Taskcomment.new(taskcomment_params)
    if @taskcomment.save
      head :no_content
    else
      render json: @taskcomment.errors, status: :unprocessable_entity
    end
  end

  def update
    @taskcomment = Taskcomment.find(params[:id])
    if @taskcomment.update(taskcomment_params)
      render :show, status: :ok
    else
      render json: @taskcomment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @taskcomment = Taskcomment.find(params[:id])
    if @taskcomment.destroy
      head :no_content
    else
      render json: @taskcomment.errors, status: :unprocessable_entity
    end
  end

  def taskcomment_params
     params.require(:taskcomment).permit(:title,:comment, :task_id)
  end
end