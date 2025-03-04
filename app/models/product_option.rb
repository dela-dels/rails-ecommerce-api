class ProductOption < ApplicationRecord
  has_many :product_option_values

  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 1000 }


  def as_json(options = {})
    super(options.merge({
      only: [ :id, :name, :description ]
    }))
  end
end
