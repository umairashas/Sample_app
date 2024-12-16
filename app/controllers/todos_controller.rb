class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :check_todo_limit, only: [:create]
  load_and_authorize_resource

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to root_path, notice: 'Todo was successfully created.'
    else
      redirect_to root_path, alert: 'Todo list cannot be blank'
    end
  end

    def update
    @todo = current_user.todos.find(params[:id])
    
    # Update the status based on the checkbox
    @todo.status = params[:todo][:completed] == "1" ? 'completed' : 'pending'
    if @todo.save
      redirect_to root_path, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end
  

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
    redirect_to root_path, notice: 'Todo was successfully deleted.'
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def check_todo_limit
    if current_user.todos.count >= 5
      redirect_to todos_path, alert: 'You cannot create more than 5 todos.'
    end
  end
end
