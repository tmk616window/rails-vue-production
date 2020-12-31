class ChatsController < ApplicationController
  def index
    @tasks = Task.all
  end
end
