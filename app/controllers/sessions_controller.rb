class SessionsController < ApplicationController
  def create
    @session = Session.new(formation_params)
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
