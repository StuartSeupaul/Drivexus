class Question < ActiveRecord::Base
  validates :content, :presence => true,
                      :length => {minimum: 3},
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
    return 0.25 if answers == []

    answer_counter = 0;
    correct_counter = 0;
    correct_array = []

    answers.each do |answer|
      answer_counter += 1
      correct_counter += 1 if answer.correct
    end

    correct_counter/answer_counter.round(3)
  end

  def self.number_of_stars(difficulty_rating)
    difficulty_rating *= 100
    return case difficulty_rating
    when 90..100 then 1
    when 75..89 then 2
    when 60..74 then 3
    when 30..59 then 4
    when 0..29 then 5
    else 0
    end
  end

end
