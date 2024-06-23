# frozen_string_literal: true

class Creature < ApplicationRecord
  has_many :actors, dependent: :restrict_with_exception
end
