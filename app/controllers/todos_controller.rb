# TodosController は /todos 以下のURLを処理するクラス
class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy]

  # GET /todos or /todos.json
  def index
    todos_per_page
  end

  # GET /todos/1 or /todos/1.json
  def show; end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit; end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        todos_per_page
        format.html { redirect_to todo_url(@todo), notice: t('.success') }
        format.turbo_stream { flash.now.notice = t('.success') }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todo_url(@todo), notice: t('.success') }
        format.turbo_stream { flash.now.notice = t('.success') }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: t('.success') }
      format.turbo_stream { flash.now.notice = t('.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:name, :start, :end, :progress)
  end

  # todos_per_page は1ページに表示するTodoのリストを@todosに格納する
  # また、ransackを使って条件に合ったものを@searchに格納している
  def todos_per_page
    # ransackを使って条件に合ったものを@searchに格納
    @search = Todo.ransack(params[:q])
    # ソート処理。未指定の場合はidの大きい順
    @search.sorts = 'id desc' if @search.sorts.empty?
    # 現在のページに該当するTodoのリストを@todosに格納する
    @todos = @search.result.page(params[:page])
  end
end
