class TasksController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_task, only: [:show,:destroy,:edit,:update]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path ,notice: '記事が投稿されました'
    else
      render :new
    end  
  end

  def show
  end

  def destroy
    @task.destroy
  end

  def edit
  end

  def update
    task.update(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:image, :name, :description, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
