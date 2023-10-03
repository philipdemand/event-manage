class AttendancesController < ApplicationController

    before_action :set_attendance, only: [:show, :update, :destroy]

  def index
    if params[:user_id]
      @attendances = User.find(params[:user_id]).attendances
    elsif params[:event_id]
      @attendances = Event.find(params[:event_id]).attendances
    else
      @attendances = Attendance.all
    end
    render json: @attendances
  end

  def show
    render json: @attendance
  end

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      render json: @attendance, status: :created, location: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def update
    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance.destroy
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id, :confirmed)
  end

end
