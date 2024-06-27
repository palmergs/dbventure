# frozen_string_literal: true

class Prop < ApplicationRecord
  belongs_to :item
  belongs_to :slotted, polymorphic: true

  has_many :props, as: :slotted, dependent: :destroy

  before_validation on: :create do
    self.name = item.name if name.blank?
  end

  def slots_str= str
    self.slots = str.present? ? str.split(/\s*[,]\s*/) : []
  end

  def slots_str
    self.slots.join(', ')
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
