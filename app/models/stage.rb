# frozen_string_literal: true

class Stage < ApplicationRecord
  has_many :actors, dependent: :restrict_with_exception
  has_many :props, as: :slotted, dependent: :restrict_with_exception
  has_many :passages_in, class_name: "Passage", foreign_key: :to_id
  has_many :passages_out, class_name: "Passage", foreign_key: :from_id
  has_many :lobbies, class_name: "User", foreign_key: :stage_id

  validates :name, presence: true

  def notifications
    []
  end

  def is_seen_from
    passages_in.map(&:to)
  end

  def can_see_into
    passages_out.map(&:from)
  end
end
