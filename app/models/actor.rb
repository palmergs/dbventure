class Actor < ApplicationRecord
  belongs_to :stage
  belongs_to :creature
  has_many :props, as: :slotted, dependent: :restrict_with_exception
end
