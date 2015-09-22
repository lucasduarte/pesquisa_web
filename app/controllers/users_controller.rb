class UsersController < ApplicationController

  before_action :find_user, only: [:destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(view_context) }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(view_context) }
    end
  end

  def destroy
    @user.destroy
    redirect_to user_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
