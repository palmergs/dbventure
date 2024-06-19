class Stage < ApplicationRecord
  has_many :actors, dependent: :restrict_with_exception
  has_many :props, as: :slotted, dependent: :restrict_with_exception
  has_many :passages_in, class_name: 'Passage', foreign_key: :to_id
  has_many :passages_out, class_name: 'Passage', foreign_key: :from_id
end
