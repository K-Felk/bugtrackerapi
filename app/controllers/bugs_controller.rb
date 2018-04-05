class BugsController < ApplicationController

    before_action :set_user
  before_action :set_user_bug, only: [:show, :update, :destroy]

  before_action :sanitize_bug_params

  # GET /users/:user_id/bugs
  def index
    json_response(@user.bugs)
  end

  # GET /users/:user_id/bugs/:id
  def show
    json_response(@bug)
  end

  # POST /users/:user_id/bugs
  def create
    bug = @user.bugs.create!(bug_params)
    json_response(bug, :created)
  end

  # PUT /users/:user_id/bugs/:id
  def update
    @bug.update(bug_params)
    head :no_content
  end

  # DELETE /users/:user_id/bugs/:id
  def destroy
    @bug.destroy
    head :no_content
  end

  private

  def sanitize_bug_params
    params[:priority] = params[:priority].to_i
    params[:issue_type] = params[:issue_type].to_i
    params[:status] = params[:status].to_i
  end

  def bug_params
    params.permit(:title, :description, :issue_type, :priority, :status)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_bug
    @bug = @user.bugs.find_by!(id: params[:id]) if @user
  end
end
