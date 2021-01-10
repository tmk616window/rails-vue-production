class Api::LikesController < ApplicationController
  def index
    @likes = Like.all
  end
  
  def show
    @like = Like.where(task_id: params[:id])
  end

  def current_uer_like
    @current_uer_like = @like.find_by(user_id: @current_user.id)
  end

  def create
    @like = Like.new(like_params)
    if @like.save
      head :no_content
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      head :no_content
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def like_params
     params.require(:like).permit(:user_id, :task_id)
  end
end