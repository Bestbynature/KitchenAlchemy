class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  attr_accessor :value

  # Method to calculate the value
  def calculate_value
    self.quantity * self.food.price
  end
end
