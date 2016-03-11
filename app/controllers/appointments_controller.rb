class AppointmentsController < ApplicationController
  before_action :load_user
  # before_action :load_appointment, only: [:show, :edit, :destroy, :create]
  load_and_authorize_resource

  def index
    @users = User.all
    @appointments = @user.appointments
    @appointments_by_date = @appointments.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) :Date.today
  end

  def new
    @appointment = @user.appointments.new
    @drivers = Driver.all.map do |c|
      [c.name, c.id]
    end

  end


  def edit
    @appointment = @user.appointments.find(@user_id, @appointment)
  end


  def create
    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save
      redirect_to user_appointment_path(@user,@appointment)
    else
      render :new
    end
  end

  def show
    @nearby_driver = @driver.nearbys
    @nearby_drivers.each do |d|
      [d.name]
    end
    @drivers = @appointment.nearby_drivers(10, unit: :km)

  end

  def update
   @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
      redirect_to user_appointment_path(@user, @appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to user_appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date,:user_id, :description, :driver_id, :time)
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  # def load_appointment
  #   @appointment = Appointment.find(params[:id])
  # end

end
