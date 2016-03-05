class ExamQuestionsController < ApplicationController
  def index
    @examquestions = ExamQuestion.all
  end

  def create
    @examquestion = ExamQuestion.build(examquestion_params)

    
  end

  private
  def examquestion_params
    params.require(:examquestion).permit(:exam_id, :question_id)
  end
end
