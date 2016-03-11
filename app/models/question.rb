class Question < ActiveRecord::Base
  has_many :choices
  has_many :attacheds
  has_many :exams, :through => :attacheds

  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
end
