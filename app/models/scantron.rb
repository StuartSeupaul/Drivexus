class Scantron < ActiveRecord::Base
  has_many :answers
  belongs_to :exam
  belongs_to :user

  def convert_to_percent
    self.result * 100
  end
end
