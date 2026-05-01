module DietParams
  private

  def diet_params
    params.require(:diet).permit(
      :title,
      meals_attributes: [
        :id, :name, :_destroy,
        meal_items_attributes: [
          :id, :name, :quantity, :_destroy
        ]
      ]
    )
  end
end
