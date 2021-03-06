class ExamsController < ApplicationController
  before_action :load_cohort, only: [:show, :destroy, :edit, :new, :create]
  before_action :load_exam, only: [:show]

  def index
    @exams = @cohort.exams
  end

  def new
    @exam = @cohort.exams.build
  end

  def show
    # For creating an exam
    @questions = Question.all
    @attachedquestion = Attached.new
    @attachedquestions = @exam.questions
    @unusedquestions = @questions - @attachedquestions

    # For doing an exam
    if Scantron.where(user_id: current_user).where(exam_id: @exam.id).first
      @scantron = Scantron.where(user_id: current_user.id).where(exam_id: @exam.id).first
    else
      @scantron = Scantron.create(user_id: current_user.id, exam_id: @exam.id)
    end

    @answers = @scantron.answers if @scantron.result
    @categories = Category.all
  end

  def edit
  end

  def update
    if @exam.update_attributes(exam_params)
      redirect_to exam_path(@exam)
    end
  end

  def create
    @exam = @cohort.exams.build(exam_params)

    if @exam.save
      redirect_to cohort_path(@cohort)
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

  def load_exam
    @exam = Exam.find(params[:id])
  end
end
