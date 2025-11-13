class Product < ApplicationRecord
  has_one_attached :featured_image
  has_rich_text :description
  validates :name, presence: true
end

# Touched: 2025-11-13 - non-functional comment to mark core model file
