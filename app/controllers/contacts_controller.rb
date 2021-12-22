# frozen_string_literal: true

# class for the contacts
class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts
  end

  # GET /contacts/1
  def show
    # para evitar fazer uma nova requisição para buscar o kind, adicionar:
    # include: :kind
    render json: @contact, include: %i[kind address phones]
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    #      params.require(:contact).permit(
    #         :name,
    #         :email,
    #         :birthdate,
    #         :kind_id,
    #         phones_attributes: [:id, :number, :_destroy],
    #         address_attributes: [:id, :street, :city]
    #       )
  end
end
