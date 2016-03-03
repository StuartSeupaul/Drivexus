class ExamsController < ApplicationController
  before_action :load_cohort, only [:show, :destroy, :edit, :new]

  def index
    @exams = @cohort.exams
    @exam = @cohort.exams.build
  end

  def show
  end

  def edit
  end

  def update
    if @exam.update_attributes(exam_params)
      redirect_to exam_path(@exam)
    end
  end

  def create
    if @exam.save
      redirect_to cohorts_path
    else
      render :new
    end
  end

  def destroy
    @exam.destroy
    redirect_to cohorts_path
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :cohort_id)
  end

  def load_cohort
    @cohort = Cohort.find(params[:cohort_id])
  end


end
