class AttachedsController < ApplicationController
  def create
    @attachedquestion = Attached.new(attached_params)

    respond_to do |format|
      if @attachedquestion.save
        format.js
      end
    end
  end

  private

  def attached_params
    params.require(:attached).permit(:exam_id, :question_id)
  end
end
