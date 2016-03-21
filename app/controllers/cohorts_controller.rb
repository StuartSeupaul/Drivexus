class CohortsController < ApplicationController
  require 'gruff'

  before_action :load_cohort, only: [:show, :edit, :destroy]

  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def show
    @exams = @cohort.exams

    if @cohort.users.any?
      @users = @cohort.users
    end

    if User.any?
      @user_list = User.all - @users
    end

    @exam_labels = {}
    @exams.each_with_index { |exam, index|
      @exam_labels[index] = exam.name
    }

    g = Gruff::Area.new
    g.title = "Exam Results for Cohort"
    g.labels = @exam_labels
    @users.each { |user|
      test_results = []
      user.scantrons.each { |scantron|
        test_results << scantron.result if scantron.result != nil
      }
      g.data user.name.to_sym, test_results
    }
    g.marker_count = 1
    g.write('app/assets/images/examresults.png')

  end

  def update
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to cohorts_path
    else
      render :new
    end
  end

  def destroy
    @cohort.destroy
  end

  private
  def cohort_params
    params.require(:cohort).permit(:name, :user_id, :start_date, :end_date)
  end

  def load_cohort
    @cohort = Cohort.find(params[:id])
  end

end
