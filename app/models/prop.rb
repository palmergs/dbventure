# frozen_string_literal: true

class Prop < ApplicationRecord
  belongs_to :item
  belongs_to :slotted, polymorphic: true

  before_validation on: :create do
    self.name = item.name if name.blank?
  end

  def stored?
    slotted.is_a?(Item)
  end

  def carried?
    slotted.is_a?(Actor)
  end

  def dropped?
    slotted.is_a?(Stage)
  end
end
