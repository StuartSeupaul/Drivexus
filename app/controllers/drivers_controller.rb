class DriversController < ApplicationController
  # before_action :load_driver
  # before_action :load_appointment, only: [:show, :edit, :destroy]
  # before_action :load_user
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

      if @driver.save
        redirect_to driver_path(@driver)
      else
        render :new
      end
  end

  def destroy
    @driver.destroy
  end

  def show
    @driver = Driver.find(params[:id])
    @appointments = @driver.appointments
    @appointments_by_date = @appointments.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) :Date.today

  end


  private

  def driver_params
    params.require(:driver).permit(:id, :name, :bio)
  end

  # def load_driver
  #   @driver = Driver.find(params[:id])
  # end

  # def load_appointment
  #   @appointment = Appointment.find(params[:id])
  # end

  # def load_user
  #   @user = User.find(params[:id])
  # end


end
