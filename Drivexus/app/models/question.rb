class Question < ActiveRecord::Base
  has_many :choices

  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true
end
