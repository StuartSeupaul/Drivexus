class AttachedsController < ApplicationController
  def create
    @attachedquestion = Attached.new(attached_params)

    if @attachedquestion.save
      redirect_to :back
    end
  end

  private

  def attached_params
    params.require(:attached).permit(:exam_id, :question_id)
  end
end
