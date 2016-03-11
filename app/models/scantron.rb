class Scantron < ActiveRecord::Base
  has_many :answers
  belongs_to :exam


end
