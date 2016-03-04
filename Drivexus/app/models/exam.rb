class Exam < ActiveRecord::Base
  belongs_to :cohort
  has_many :exam_questions

end
