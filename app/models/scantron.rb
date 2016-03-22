class Scantron < ActiveRecord::Base
  validates :user_id, :presence => true

  has_many :answers
  belongs_to :exam
  belongs_to :user

  def convert_to_percent
    (self.result*100).round(2)
  end

  def self.find_scantron_by_exam(exam_id, user_id)
    Scantron.where(exam_id: exam_id).where(user_id: user_id).first
  end

  def self.class_for_scantron(exam_id, user_id)
    scantron_class = ""
    if Scantron.find_scantron_by_exam(exam_id, user_id)
      scantron_current = Scantron.find_scantron_by_exam(exam_id, user_id)
      if scantron_current.result != nil
        scantron_current.result > 0.75 ? scantron_class = "cohorts-exam-list-passed" : scantron_class = "cohorts-exam-list-failed"
      else
        return false
      end
    else
      return false
    end

    scantron_class
  end

  def self.any_test_complete?(user_id)
    Scantron.where(user_id: user_id).where.not('result' => nil).first
  end

  def self.get_scantrons_with_game_finished
    Scantron.where.not('game_name' => nil).where.not('result' => nil)
  end

end
