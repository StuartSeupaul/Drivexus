class Cohort < ActiveRecord::Base
  validates :name, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true

  has_many :exams
  has_many :users

  def end_display
    mytime = self.end_date
    mytime.strftime("%B %-d, %Y")
  end

  def start_display
    mytime = self.start_date
    mytime.strftime("%B %-d, %Y")
  end

  def self.get_cohort_by_exam(exam)
    Cohort.where(id: exam.cohort_id).first
  end
end
