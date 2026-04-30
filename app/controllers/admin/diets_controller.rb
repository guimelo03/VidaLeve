class Admin::DietsController < ApplicationController
  before_action :set_user
  def new
    @diet = @user.diets.build
    @diet.meals.build.meal_items.build
  end

  def create
    @diet = @user.diets.build(diet_params)

    if @diet.save
      redirect_to admin_user_path(@user), notice: "Dieta criada com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.client.find(params[:user_id])
  end

  def diet_params
    params.require(:diet).permit(
      :title,
      meals_attributes: [
        :id, :name, :_destroy,
        meals_items_attributes: [
          :id, :name, :quantity, :_destroy
        ]
      ]
    )
  end
end
