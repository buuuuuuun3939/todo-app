class SubtasksController < ApplicationController
  before_action :set_subtask, only: %i[ show edit update destroy ]

  # GET /subtasks or /subtasks.json
  def index
    @subtasks = Subtask.all
  end

  # GET /subtasks/1 or /subtasks/1.json
  def show
  end

  # POST /subtasks or /subtasks.json
  def create
    @subtask = Subtask.new(subtask_params)

    if @subtask.save
      format.json { render :show, status: :ok, location: @subtask }
    else
      format.json { render json: @subtask.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /subtasks/1 or /subtasks/1.json
  def update
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.json { render :show, status: :ok, location: @subtask }
      else
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtasks/1 or /subtasks/1.json
  def destroy
    @subtask.destroy
    format.json { head :no_content }
  end

  private
    # Only allow a list of trusted parameters through.
    def subtask_params
      params.fetch(:subtask, {})
    end
end
