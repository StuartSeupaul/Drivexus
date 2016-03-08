class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)

    if @answer.save

    end
  end

  private
  def answer_params
    params.require(:answer).permit(:scantron_id, :question_id, :correct)
  end
end
