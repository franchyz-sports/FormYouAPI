class StudentsController < ApplicationController
  before_action :check_auth, only: [:show, :edit, :update, :destroy]
  before_action :decode_token, only: [:show, :edit, :update, :destroy]
  before_action :set_student, only: [:show, :update, :destroy, :destroy]

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
    @student
    @sessions = @student.sessions
    @company = @student.company
  end

  def edit
    student_id = @student.id
    user_id = @decoded_token[0]['sub']
    user_type = @decoded_token[0]['scp']
    @student_data = Student.get_data(student_id, user_id, user_type)
  end

  # PATCH/PUT /Students/1
  def update
    student_id = @student.id
    user_id = @decoded_token[0]['sub']
    user_type = @decoded_token[0]['scp']
    @student_data = Student.get_data(student_id, user_id, user_type)
    if @student_data.update(student_params)
      render json: @student_data
    else
      render json: @student_data.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Students/1
  def destroy
    student_id = @student.id
    user_id = @decoded_token[0]['sub']
    user_type = @decoded_token[0]['scp']
    @student_data = Student.get_data(student_id, user_id, user_type)
    @student_data.destroy
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :gender, :address, :city, :zip_code, :study_level, :email)
  end
end
