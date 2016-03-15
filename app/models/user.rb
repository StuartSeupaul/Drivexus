class User < ActiveRecord::Base
  has_many :appointments
  has_many :scantrons
  has_many :drivers, through: :appointments
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true

  ROLES = %i[admin student driving_instructor]

  def self.instructor_id(name)
    u = User.where(name: name).first
    u.id
  end
end
