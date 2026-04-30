class Clients::DietsController < Clients::BaseController
  def show
    @diet = current_user.diets.includes(meals: :meal_items).find(params[:id])
  end
end
