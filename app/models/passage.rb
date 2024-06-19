class Passage < ApplicationRecord
  belongs_to :from, class_name: 'Stage'
  belongs_to :to, class_name: 'Stage'
end
