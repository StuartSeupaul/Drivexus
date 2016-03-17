class AttachedsController < ApplicationController
  def create
    @attachedquestion = Attached.new(attached_params)

    exID = attached_params[:exam_id]
    @ex = Exam.find(exID)

    respond_to do |format|
      if @attachedquestion.save
        @qs = Question.all
        @attachedqs = @ex.questions
        @index = @attachedqs.count - 1
        @unusedqs = @qs - @attachedqs
        @current_question = Question.where(id: @attachedquestion.question_id).first
        @category = Category.where(id: @current_question.category_id).first
        @category.questions.each do |question|
          @attachedqs.include?(question) ? @category_questions << question : @category_questions
        end
        format.js
      end
    end

  end

  private

  def attached_params
    params.require(:attached).permit(:exam_id, :question_id)
  end
end
