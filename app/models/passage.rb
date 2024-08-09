# frozen_string_literal: true

class Passage < ApplicationRecord
  belongs_to :from, class_name: "Stage"
  belongs_to :to, class_name: "Stage"

  validates :direction, presence: true, uniqueness: { scope: :from_id }

  def open?
    true
  end

  def compass?
    %w[North South East West Northwest Northeast Southwest Southeast].include?(direction)
  end
end
