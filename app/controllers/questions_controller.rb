class QuestionsController < ApplicationController
  # before_action :load_exam, only: [:create]

  def index
    @questions = Question.all
    answers = Question.first.answers_for_a_question * 100
    Question.average_difficulty_of_question(answers)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params)
    if @question.save
      redirect_to questions_path
    end
  end

  private
  def questions_params
    params.require(:question).permit(:content, :exam_id, :category_id,
                                    choices_attributes: [:id, :content, :question_id, :correct, :_destroy])
  end

  # def load_exam
  #   @exam = Exam.find(params[:exam_id])
  # end
end
