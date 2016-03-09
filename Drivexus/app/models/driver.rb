class Driver < ActiveRecord::Base
  has_many :appointments
  has_many :students, class_name: "User", foreign_key: "student_id", through: :appointments
end
