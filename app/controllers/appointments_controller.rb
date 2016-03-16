class AppointmentsController < ApplicationController
  before_action :load_user
  # before_action :load_appointment, only: [:show, :edit, :destroy, :create]
  load_and_authorize_resource

  def index

    @users = User.all
    @appointments = @user.appointments
    @appointments_by_date = @appointments.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) :Date.today

    if params[:address]
    @nearby_drivers = Driver.all.near(params[:address], 10, unit: :km)
      respond_to do |format|
        # format.html
        # format.js
      end
    elsif params[:latitude] && params[:longitude]
    @nearby_drivers = Driver.near([params[:latitude], params[:longitude]], 10, unit: :km)
    respond_to do |format|
      # format.html
      format.js
    end
    else
      @drivers = Driver.all
    end


  end

  def new
    @appointment = @user.appointments.new
  end

#
#



  def edit
    @appointment = @user.appointments.find(@user_id, @appointment)
  end


  def create
    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save

      respond_to do |format|

        format.html{ redirect_to user_appointment_path(@user,@appointment)}
        format.js { }
      end
      else
      render :new
    end
  end

  def show

    @drivers = Driver.all

    @nearby_drivers.each do |d|
      [d.name]
    end

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
    params.require(:appointment).permit(:date,:user_id, :description, :driver_id, :time, :address)
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end
