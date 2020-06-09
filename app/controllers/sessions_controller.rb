class SessionsController < ApplicationController

  def show 
    @session = Session.find(params[:id])

    render json: @session
  end

  def create
    @session = Session.new(session_params)
    if admin_signed_in?
      if @session.save
        render json: @session, status: :created, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    else
      "ERREUR"
    end

  end
end
