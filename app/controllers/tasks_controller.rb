class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :move]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.js
        # format.html { redirect_to @task, notice: 'Task was successfully created.' }
        # format.json { render :show, status: :created, location: @task }
      else
        format.js { render status: 422 }
        # format.html { render :new }
        # format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    # binding.pry
    respond_to do |format|
      if @task.update(task_params)
        format.js
      else
        format.js { render status: 422 }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      # format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  def move
    @task.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:id, :name, :status, :project_id, :position)
    end
end
