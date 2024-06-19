class Item < ApplicationRecord
  has_many :props, dependent: :restrict_with_exception
end
