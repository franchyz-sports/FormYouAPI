class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :update, :destroy]

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(session_id: attendance_params[:session_id], student_id: current_student.id)

    if @attendance.save
      render json: @attendance, status: :created
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    if current_teacher != nil
      if @attendance.update(attendance_params)
        render json: @attendance
      else
        render json: @attendance.errors, status: :unprocessable_entity
      end
    else
      render json: "Only teachers are allowed to modify attendances", status: :unprocessable_entity
    end

  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:note, :present, :session_id)
    end
end
