class Exam < ActiveRecord::Base
  validates :name, :presence => true
  validates :cohort_id, :presence => true

  belongs_to :cohort
  has_many :attacheds
  has_many :questions, :through => :attacheds
  has_many :scantrons

  def average_grade
    if self.scantron.any?
      total_score = 0
      total_questions = 0
      running_score = []

      self.scantrons.each do |scantron|
        if scantron.answers.any?
          scantron.answers.each do |answer|
            total_questions += 1
            if answer.correct == true
              total_score += 1
            end
          end
        running_score << total_score/total_questions
        end
      end

      running_score != 0 ? "#{((running_score.sum / running_score.length)*100)}%" : ""
    end
  end

  def self.get_exam_by_scantron(scantron)
    Exam.where(id: scantron.exam_id).first
  end

end
