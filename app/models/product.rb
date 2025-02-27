class Product < ApplicationRecord
  has_many_attached :images

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 1000 }
  validates :description, presence: true, length: { maximum: 512, minimum: 100 }
  validates :restock_level, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_available, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :images, presence: true, attached: true,
  content_type: [
    "image/png",
    "image/jpeg"
    ], size: { less_than: 5.megabytes }

  def as_json(options = {})
    super(options).merge({
      images: {
        url: image_urls
      }
    })
  end

    # Method to generate the image URL if we had a has_one_attached relationship
    def image_url
      if images.attached?
        Rails.application.routes.url_helpers.url_for(images)
      else
        nil
      end
    end

  # Method to generate an array of image URLs
  def image_urls
    if images.attached?
      images.map { |image| Rails.application.routes.url_helpers.url_for(image) }
    else
      []
    end
  end
end
