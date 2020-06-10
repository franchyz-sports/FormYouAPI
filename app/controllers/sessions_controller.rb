class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def show
    render json: @session
  end

  def index
    @sessions = Session.where(formation_id: params[:formation_id])
    render json: @sessions
  end

  def all_sessions
    if is_admin?
      render json: @sessions = Session.all
    else
      render 'error'
    end
  end

  def my_sessions
    id = Teacher.all.sample.id
    @sessions = Session.get_my_sessions(id)
    render json: @sessions
  end

  def create
    @session = Session.new(session_params)
    if is_admin?
      if @session.save
        render json: @session, status: :created, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    else
      "ERREUR"
    end
  end

  def edit
    if is_admin?
      render json: @session
    else
      render 'error'
    end
  end

  def update
    if is_admin?
      if @session.update(session_params)
        render json: @session, status: :updated, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    else
      "ERREUR"
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formation_params
      params.require(:session).permit(:max_student, :date)
    end
end
