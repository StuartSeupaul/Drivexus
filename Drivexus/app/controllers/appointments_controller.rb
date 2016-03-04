class AppointmentsController < ApplicationController
  before_action :load_user
  before_action :load_appointment, only: [:show, :edit, :destroy]

  def index

    @appointments = @user.appointments

  end

  def new
    @appointment = @user.appointments.build

  end

  def edit

  end

  def create
    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save
      redirect_to user_appointments_path(@user,@appointment)
    else
      render :new
    end



  end

  def show

  end

  def update
    if @appointment.update_attributes(appointment_params)
      redirect_to user_appointment_path(@user, @appointment)
    end
  end

  def destroy
    @appointment.destroy
    link_to user_path 
  end
  private

  def appointment_params
    params.require(:appointment).permit(:time, :user_id, :description)
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_appointment
    @appointment = Appointment.find(params[:id])
  end




end
