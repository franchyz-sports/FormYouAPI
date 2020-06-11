class FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :update, :destroy]


  before_action :check_auth, only: [:myformations]
  before_action :decode_token, only: [:myformations]

  #before_action :check_auth, except: [:index, :show]
  #before_action :decode_token, except: [:index, :show]
  #before_action :admin, only: [:all_formations, :create, :edit, :update, :destroy]
  #
  # GET /formations
  def index
    @formations = Formation.all
  end

  # GET /formations/1
  def show
    @formation
    @sessions = @formation.sessions
  end

  # GET /myformations
  def myformations
    id = @decoded_token[0]['sub']
    type = @decoded_token[0]['scp']
    @personal_formations = Formation.get_personal_formations(id, type)
    render json: @personal_formations
  end

  # POST /formations
  def create
    @formation = Formation.new(formation_params)
      if @formation.save
        render json: @formation, status: :created, location: @formation
      else
        render json: @formation.errors, status: :unprocessable_entity
      end
  end

  def edit
    render json: @formation
  end

  # PATCH/PUT /formations/1
  def update
    if @formation.update(formation_params)
      render json: @formation
    else
      render json: @formation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formations/1
  def destroy
    @formation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation
      @formation = Formation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formation_params
      params.require(:formation).permit(:title, :description)
    end
end
