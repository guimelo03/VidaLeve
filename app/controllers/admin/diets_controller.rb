class Admin::DietsController < ApplicationController
  before_action :set_user
  before_action :set_diet, only: [ :edit, :update, :show, :update, :destroy ]
  def new
    @diet = @user.diets.build
    @diet.meals.build.meal_items.build
  end

  def show
    @diet = @user.diets.includes(meals: :meal_items).find(params[:id])
  end

  def edit
  end

  def create
    @diet = @user.diets.build(diet_params)

    if @diet.save
      redirect_to admin_user_path(@user), notice: "Dieta criada com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    Rails.logger.debug "DIET PERSISTED? #{@diet.persisted?}"

    if @diet.update(diet_params)
      redirect_to admin_user_diet_path(@user, @diet), notice: "Dieta atualizada"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diet.destroy
    redirect_to admin_user_path(@user), notice: "Dieta excluída com sucesso"
  end

  private

  def set_user
    @user = User.client.find(params[:user_id])
  end

  def set_diet
    @diet = @user.diets.find(params[:id])
  end
end
