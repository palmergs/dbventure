# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :rememberable,
         :validatable

  has_many :actors, dependent: :restrict_with_exception

  belongs_to :character, class_name: "Actor", optional: true, foreign_key: :character_id, inverse_of: :player
  has_one :stage, through: :character
  has_many :props, through: :character

  belongs_to :lobby, class_name: 'Stage', optional: true, foreign_key: :stage_id, inverse_of: :lobbies

  validates :email, presence: true, uniqueness: true
  validates :character_id, uniqueness: { allow_nil: true }

  after_create :generate_lobby

  def generate_lobby
    unless self.lobby
      stage = Stage.create!(name: 'Your Home')
      passage = Passage.create!(name: 'A doorway leads to adventure...',
                               direction: 'Adventure',
                               from: stage,
                               to: Stage.where(start_location: true).sample)
      self.update(lobby: stage)
    end
  end
end
