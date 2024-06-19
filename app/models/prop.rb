class Prop < ApplicationRecord
  belongs_to :item
  belongs_to :slotted, polymorphic: true

  before_validation on: :create do 
    self.name = self.item.name if self.name.blank?
  end
end
