class CohortsController < ApplicationController
  before_action :load_cohort, only: [:show, :edit, :destroy]

  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def show
  end

  def edit
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
