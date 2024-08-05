# frozen_string_literal: true

class Actor < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stage
  belongs_to :creature
  has_many :props, as: :slotted, dependent: :restrict_with_exception
  has_one :player, class_name: "User", dependent: :nullify, foreign_key: :character_id, inverse_of: :character

  validates :name, presence: true

  def alive?
    true
  end

  def mobile?
    true
  end
end
