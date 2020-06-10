class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  before_action :check_auth, only: [:my_sessions, :all_sessions]
  before_action :decode_token, only: [:my_sessions, :all_sessions]
  before_action :check_admin, only: [:all_sessions]

  #before_action :check_auth, except: [:index]
  #before_action :decode_token, except: [:index]
  #before_action :admin, only: [:all_sessions, :create, :edit, :update]

  def show 
    render json: @session
  end

  def index 
    @sessions = Session.where(formation_id: params[:formation_id])
    render json: @sessions
  end

  def all_sessions
    render json: @sessions = Session.all
  end

  def my_sessions
    id = decode_token[0]['sub']
    type = decode_token[0]['scp']
    @sessions = Session.get_my_sessions(id, type)
    puts @sessions
    render json: @sessions
  end

  def create
    @session = Session.new(session_params)
      if @session.save
        render json: @session, status: :created, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
  end

  def edit
    render json: @session
  end

  def update
      if @session.update(session_params)
        render json: @session, status: :updated, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
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

    def decode_token
      token = request.headers['Authorization'].split[1]
      decoded_token = JWT.decode token, nil, false
    end

    def check_auth
      if (request.headers['Authorization'] == nil)
        render json: 'token is missing'
      end
    end

    def check_admin
      if decode_token['scp'] != 'admin'
        render json: 'you are not an admin'
      end
    end
end
