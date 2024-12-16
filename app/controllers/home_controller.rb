# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos  # Fetch todos for the current user
  end
end