class Choice < ActiveRecord::Base
  validates :content, :presence => true,
                      :length => {minimum: 1},
                      :length => {maximum: 200}

  belongs_to :question
end
