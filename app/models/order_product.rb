class OrderProduct < ActiveRecord::Base
  validates_presence_of :quantity, :description, :price_per_unit, :product_category_id
  validates_numericality_of :quantity, :product_category_id, :only_integer => true, :greater_than => 0
  validates_numericality_of :price_per_unit,  :greater_than => 0

  belongs_to :order
  belongs_to :user
  belongs_to :product_category
  
  def total_price_per_product
    (quantity * price_per_unit).to_f
  end
end
