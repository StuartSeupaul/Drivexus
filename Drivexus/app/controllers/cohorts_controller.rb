class CohortsController < ApplicationController
  before_action :load_cohort only: [:show, :edit, :destroy]

  def index
    @cohort = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def edit
    @cohort = Cohort.find(params[:id])
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
