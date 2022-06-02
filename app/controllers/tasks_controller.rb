class TasksController < ApplicationController
  #before_action :set_task, only: %i[ show edit update destroy ]
  protect_from_forgery :except => [:create]
  #wrap_parameters :tasks, include: [:name, :deadline, :create_user, :assignee_user, :public, :completed, :total_subtask_amount, :finished_subtask_amount]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:task_id])
    render json: @task
  end

  # GET /tasks/new
  #def new
  #  @task = Task.new
  #end

  # POST /tasks or /tasks.json
  def create
    # assignee_emailを基にusernのidを特定してassignee_idとする
    assignee_user = User.find_by(email: task_params[:assignee_email])
    #print(assignee_user[:id]) # assignee_user[:id]で特定したuserのidが取れる
    
    @task = Task.new(name: task_params[:name],
                     description: task_params[:description],
                     deadline: task_params[:deadline],
                     completed: 0, # タスク生成時は必ず未完了状態である
                     user_id: 1,   # ここはsessionで得たidを入れる必要がある
                     assignee_id: assignee_user[:id],
                     public: task_params[:public]
    )
    @task.save

    #print(@task[:id])
    @subtask = Subtask.new(task_id: @task[:id],
                           description: task_params[:description],
                           completed: 0 # サブタスク生成時は必ず未完了状態である 
    )
    @subtask.save
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      request_body = JSON.parse(request.body.read)
      email = request_body[:name]
      #print(email)
      assignee_user = User.find(task_params[:assignee_email])
      ignore_subtasks = {"name": task_params[:name], 
                         "deadline": task_params[:deadline], 
                         "create_user": task_params[:create_user], 
                         "assignee_id": assignee_user[:user_id], 
                         "public": task_params[:public]}
      #print(ignore_subtasks)
      #if @task.update(ignore_subtasks)
      #  response.status = 200
      #else
      #  format.json { render json: @task.errors, status: :unprocessable_entity }
      #end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = Task.find_by(params[:task_id])
    @task.destroy # とりあえず削除できるけど、タスク作成者をきちんと確認する実装が必要
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_task
    #  @task = Task.find(params[:id])
    #end

    # Only allow a list of trusted parameters through.
    def task_params
      #params.fetch(:task, {})
      params.permit(:task, :description, :name, :deadline, :assignee_email, :public, subtasks:[:description]) 
    end
end
