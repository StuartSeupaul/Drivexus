class GradesController < ApplicationController
  def create

  end

  private
  def grade_params
    params.require(:grade).permit(:student_id, :test_name, :result)
  end

end
