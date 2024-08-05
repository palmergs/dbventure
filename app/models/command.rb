class Command < ApplicationRecord
  class Result
    attr_reader :render, :success
    def initialize(render, success = true, outcome = nil)
      @render = render
      @success = success
      @outcome = outcome
    end

    def outcome
      success ? @outcome : false
    end
  end

  enum outcome: %i[attacked
                   killed
                   crafted
                   discovered
                   destroyed], _prefix: "outcome"

  belongs_to :stage
  belongs_to :user
  belongs_to :actor
  belongs_to :direct, polymorphic: true, optional: true
  belongs_to :indirect, polymorphic: true, optional: true

  validates :stage, presence: true
  validates :actor, presence: true
  validates :direct, presence: true

  before_validation on: :create do
    self.actor = self.user.character unless self.actor
    self.stage = self.user.character.stage unless self.stage
  end

  def components
    Prop.where(id: component_ids)
  end

  def execute
    raise RuntimeError, "command was not valid #{ self.inspect }" unless self.valid?

    result = self.execute_command
    self.save! if result.outcome

    result.render
  end
end
