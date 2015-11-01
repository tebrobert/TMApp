class TodosController < ApplicationController
  def index
    @projects = Project.all
  end

  def update
  end

  def create
    # render plain: params[:todo].inspect
    
    @todo = Todo.new(todo_params)
    # Project.last.todos << @todo
    @todo.save
    redirect_to todos_path
  end
  
  private
    def todo_params
      params.require(:todo).permit(:text, :project_id)
    end
end
