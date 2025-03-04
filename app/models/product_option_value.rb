class ProductOptionValue < ApplicationRecord
  belongs_to :product_option
  belongs_to :product
end
