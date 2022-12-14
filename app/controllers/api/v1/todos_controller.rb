class Api::V1::TodosController < ApplicationController
  # GET /todos
  def index
    @todos = Todos.all
    render json: @todos
  end

  # GET  /todos/:id
  def show
    @todo = Todos.find(params[:id])
    render json: @todo
  end

  # POST /todos
  def create
    @todos = Todos.new(todo_params)
    if @todos.save
      render json: @todos
    else
      render error: { error: 'Unable to create Todo.' }, status: 400
    end
  end

  # PUT /todos/:id
  def update
    @todos = Todos.find(params[:id])
    if @todos
      @todos.update(todo_params)
      render json: { message: 'Todo successfully update. '}, status:200
    else
      render json: { error: 'Unable to update Todo. '}, status:400
    end
  end

  # DELETE /todos/:id
  def destroy
    @todo = Todos.find(params[:id])
    if @todo
      @todo.destroy
      render json: { message: 'Todo successfully deleted. '}, status: 200
    else
      render json: { error: 'Unable to delete Todo. '}, status: 400
    end
  end

  private

  def todo_params
    params.require(:todos).permit(:topic, :description)
  end
end
