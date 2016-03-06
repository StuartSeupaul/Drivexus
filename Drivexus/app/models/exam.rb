class Exam < ActiveRecord::Base
  belongs_to :cohort
  has_many :attacheds
  has_many :questions, :through => :attacheds
end
