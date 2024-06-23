class Prop < ApplicationRecord
  belongs_to :item
  belongs_to :slotted, polymorphic: true

  before_validation on: :create do
    self.name = item.name if name.blank?
  end
end
