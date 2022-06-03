class TasksController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :create, :update, :delete]
  before_action :correct_user,   only: [:update, :delete]
  protect_from_forgery :except => [:create, :update]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:task_id])
    render json: @task
  end

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
    @subtask = Subtask.find_by(task_id: params[:id]) 
    @subtask.update(#id: task_params[:subtasks][:id],
                    id: @subtask[:id],
                    task_id: params[:id],
                    description: task_params[:subtasks][0][:description],
                    completed: 0 # ここはきちんとjsonを見て処理する必要がある
                    #completed: task_params[:subtasks][0][:completed]
    )
    #@subtask.update

    assignee_user = User.find_by(email: task_params[:assignee_email])
    #print(assignee_user[:id]) # assignee_user[:id]で特定したuserのidが取れる
    
    #@task = Task.update(id: params[:id],
    #                name: task_params[:name],
    #                description: task_params[:description],
    #                deadline: task_params[:deadline],
    #                completed: 0, # サブタスクが全て完了したら1にする実装を行う必要がある
    #                user_id: 1,   # ここはsessionで得たidを入れる必要がある
    #                assignee_id: assignee_user[:id],
    #                public: task_params[:public]
    #)
    #@task.save
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = Task.find_by(params[:task_id])
    @task.destroy # とりあえず削除できるけど、タスク作成者をきちんと確認する実装が必要
  end

  private
    # Only allow a list of trusted parameters through.
    def task_params
      #params.fetch(:task, {})
      params.permit(:task, :description, :name, :deadline, :assignee_email, :public, subtasks:[:description]) 
    end
    
     # beforeアクション
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
      end
    end
   
    # beforeアクション 
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      #redirect_to(root_url) unless current_user?(@user)
    end
end