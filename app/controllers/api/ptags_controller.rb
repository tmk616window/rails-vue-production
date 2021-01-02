class Api::PtagsController < ApplicationController
  def index
    @ptags = Ptag.where(params[:task_id])
  end
  
  def show
    @ptag = Ptag.where(task_id: params[:id])
  #     @protag = Protag.find_by(task_id: @task.id)
  end

  def create
    @ptag = Ptag.new(ptag_params)
    if @ptag.save
      head :no_content
    else
      render json: @ptag.errors, status: :unprocessable_entity
    end
  end

  def update
    @ptag = Ptag.find(params[:id])
    if @ptag.update(ptag_params)
      render :show, status: :ok
    else
      render json: @ptag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @ptag = Ptag.find(params[:id])
    if @ptag.destroy
      head :no_content
    else
      render json: @ptag.errors, status: :unprocessable_entity
    end
  end

  def ptag_params
     params.require(:ptag).permit(:tag, :task_id)
  end
end