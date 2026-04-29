class Admin::UsersController < ApplicationController
  def index
    @users = User.client.order(created_at: :desc).limit(50)
  end

  def show
    @user = User.client.find(params[:id])
  end
end
