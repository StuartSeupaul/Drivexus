class User < ActiveRecord::Base
  has_many :appointments
  has_many :scantrons
  has_many :drivers, through: :appointments
  belongs_to :cohort
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

  def completed_any_test?
    Scantron.any_test_complete?(self.id)
  end

  def self.any_user_completed_test?
    User.all.each { |user|
      return true if Scantron.any_test_complete?(user.id)
    }
    return false
  end

end
