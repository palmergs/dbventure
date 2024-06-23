# frozen_string_literal: true

class Passage < ApplicationRecord
  belongs_to :from, class_name: "Stage"
  belongs_to :to, class_name: "Stage"

  validates :direction, presence: true, uniqueness: { scope: :to_id }
end
