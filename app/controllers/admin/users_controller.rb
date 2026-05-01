class Admin::UsersController < ApplicationController
  def index
    @users = User.client.page(params[:page]).per(10)
  end

  def show
    @user = User.client.find(params[:id])
    @diets = @user.diets.includes(meals: :meal_items)
  end

  def assign_professional
    @user = User.client.find(params[:id])

    if @user.update(professional_id: params[:user][:professional_id])
      redirect_to admin_user_path(@user), notice: "Profissional vinculado com sucesso."
    else
      redirect_to admin_user_path(@user), alert: "Não foi possível vincular."
    end
  end
end
