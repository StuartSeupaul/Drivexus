class Exam < ActiveRecord::Base
  belongs_to :cohort
  has_many :questions, :through => :tickets

end
