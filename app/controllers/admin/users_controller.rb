class Admin::UsersController < ApplicationController
  def index
    @users = User.client.page(params[:page]).per(10)
  end

  def show
    @user = User.client.find(params[:id])
    @diets = @user.diets.includes(meals: :meal_items)
  end
end
