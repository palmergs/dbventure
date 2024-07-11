class Command < ApplicationRecord
  enum outcome: %i[attacked
                   killed
                   crafted
                   discovered
                   destroyed], _prefix: 'outcome'

  belongs_to :stage
  belongs_to :user
  belongs_to :actor
  belongs_to :direct, polymorphic: true, optional: true
  belongs_to :indirect, polymorphic: true, optional: true

  before_validation on: :create do
    self.actor = self.user.character unless self.actor
    self.stage = self.user.character.stage unless self.stage
  end

  def components
    Prop.where(id: component_ids)
  end

  def execute
    if self.valid?
      if self.execute_command && self.outcome
        self.save!
      end

      true
    end

    false
  end
end
