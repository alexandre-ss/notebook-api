# frozen_string_literal: true

# class for kind of contacts: 1 - n
class KindsController < ApplicationController
  before_action :authenticate_user!
  ###### token auth
  #TOKEN = "secret"
  #include ActionController::HttpAuthentication::Token::ControllerMethods
  ######

  ###### Basic auth
  #include ActionController::HttpAuthentication::Basic::ControllerMethods
  #http_basic_authenticate_with name: 'admin', password: '123456', only: %i[create update destroy]
  ######
  #before_action :authenticate, only: %i[create update destroy index]
  before_action :set_kind, only: %i[show update destroy]
  # GET /kinds
  def index
    @kinds = Kind.all

    render json: @kinds
  end

  # GET /kinds/1
  def show
    render json: @kind
  end

  # POST /kinds
  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kinds/1
  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kinds/1
  def destroy
    @kind.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kind
    kind = params[:contact_id] ? Contact.find(params[:contact_id]).kind_id : Kind.find(params[:id]).id
    @kind = Kind.find(kind)
  end

  #def authenticate
  #  authenticate_or_request_with_http_token do |token, options|
      #ActiveSupport::SecurityUtils.secure_compare(
        #::Digest::SHA256.hexdigest(token),
        #::Digest::SHA256.hexdigest(TOKEN)
      #)
  #    JWT.decode token, PASSWORD, true, {algorithm: 'HS256'}
  #  end
  #end
  # Only allow a list of trusted parameters through.
  def kind_params
    params.require(:kind).permit(:description)
  end
end
