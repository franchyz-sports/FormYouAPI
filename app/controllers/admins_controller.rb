class AdminsController < ApplicationController
  before_action :check_auth
  before_action :decode_token
  before_action :check_admin
  before_action :set_admin

  # GET /aadmins
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  def show
    @admin
  end

  def edit
    render json: @admin
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :birthdate, :gender, :address, :city, :zip_code, :email)
  end
end
