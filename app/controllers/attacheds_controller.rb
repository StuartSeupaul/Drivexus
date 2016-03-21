class AttachedsController < ApplicationController
  def create
    @attachedquestion = Attached.new(attached_params)

    # gets the id of the newly attached question
    exID = attached_params[:exam_id]
    @ex = Exam.find(exID)

    respond_to do |format|
      if @attachedquestion.save
        # to update the question count when adding a new question to a test - for the partial rendering
        @index = @ex.questions.count - 1
        # gets all unused questions for the exam that contains the new attached question
        @unusedqs = @ex.unused_questions
        # gets the question object for the corresponding attached question
        @q = Question.where(id: attached_params[:question_id]).first
        # finds the category object for the new attached question
        @category = Category.where(id: @q.category_id).first
        # gets all of the ids for the unused questions
        @ids_of_unused_questions = @unusedqs.map(&:id)
        # gets an active record collection of all of the unused questions
        @unused_questions_in_category = @category.questions.where(id: @ids_of_unused_questions)
        format.js
      end
    end

  end

  private

  def attached_params
    params.require(:attached).permit(:exam_id, :question_id)
  end
end
