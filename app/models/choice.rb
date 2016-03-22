class Choice < ActiveRecord::Base
  validates :question_id, :presence => true
  validates :content, :presence => true,
                      :length => {minimum: 1},
                      :length => {maximum: 200}

  belongs_to :question
end
