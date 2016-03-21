class Question < ActiveRecord::Base
  validates :content, :presence => true,
                      :length => {minimum: 5},
                      :length => {maximum: 200}

  has_many :choices
  has_many :attacheds
  has_many :exams, :through => :attacheds
  belongs_to :category

  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true

  # gets all the answers by an active record collection for a specific question
  def answers_for_a_question
    @answers = if Answer.where(question_id: self.id)
      Answer.where(question_id: self.id)
    else
      []
    end
  end

  def self.average_difficulty_of_question(answers)
    # return 0.10 if answers = []

    answer_counter = 0;
    correct_counter = 0;
    correct_array = []

    answers.each do |answer|
      answer_counter += 1
      correct_counter += 1 if answer.correct
    end

    correct_counter/answer_counter.round(2)
  end

end
