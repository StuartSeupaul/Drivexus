class Answer < ActiveRecord::Base
  validates :scantron_id, :presence => true
  validates :question_id, :presence => true
  validates :correct, :presence => true
  validates :choice_id, :presence => true

  belongs_to :scantron
  belongs_to :question

end
