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

  belongs_to :character, class_name: 'Actor', optional: true, foreign_key: :character_id, inverse_of: :player
  has_one :stage, through: :character

  validates :email, presence: true, uniqueness: true
  validates :character_id, uniqueness: { allow_nil: true }

end
