class TeachersController < ApplicationController
  before_action :check_auth, only: [:show, :edit, :update, :destroy]
  before_action :decode_token, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher, only: [:show, :update, :destroy, :destroy]

  # GET /Teachers
  def index
    @teachers = Teacher.all
  end

  # GET /Teachers/1
  def show
    @teacher
    @sessions = @teacher.sessions
  end

  def edit
    teacher_id = @teacher.id
    user_id = @decoded_token[0]['sub']
    user_type = @decoded_token[0]['scp']
    @teacher_data = Teacher.get_data(teacher_id, user_id, user_type)
  end

  # PATCH/PUT /Teachers/1
  def update
    teacher_id = @teacher.id
    user_id = @decoded_token[0]['sub']
    user_type = @decoded_token[0]['scp']
    @teacher_data = Teacher.get_data(teacher_id, user_id, user_type)
    if @teacher_data.update(teacher_params)
      render json: @teacher_data
    else
      render json: @teacher_data.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Teachers/1
  def destroy
    teacher_id = @teacher.id
    user_id = @decoded_token[0]['sub']
    user_type = @decoded_token[0]['scp']
    @teacher_data = Teacher.get_data(teacher_id, user_id, user_type)
    @teacher_data.destroy
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :birthdate, :gender, :address, :city, :zip_code, :expertise, :email)
  end
end
