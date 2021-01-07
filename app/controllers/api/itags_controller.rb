class Api::ItagsController < ApplicationController
  def index
    @itags = Itag.where(params[:task_id])
  end
  
  def show
    @itag = Itag.where(task_id: params[:id])
  end

  def create
    @itag = Itag.new(itag_params)
    if @itag.save
      head :no_content
    else
      render json: @itag.errors, status: :unprocessable_entity
    end
  end

  def update
    @itag = Itag.find(params[:id])
    if @itag.update(itag_params)
      render :show, status: :ok
    else
      render json: @itag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @itag = Itag.find(params[:id])
    if @itag.destroy
      head :no_content
    else
      render json: @itag.errors, status: :unprocessable_entity
    end
  end

  def itag_params
     params.require(:itag).permit(:tag, :task_id)
  end
end