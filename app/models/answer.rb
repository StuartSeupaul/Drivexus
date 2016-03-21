class Answer < ActiveRecord::Base
  belongs_to :scantron
  belongs_to :question
end
