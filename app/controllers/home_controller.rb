class HomeController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
  end
end
