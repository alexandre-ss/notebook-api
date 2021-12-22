# frozen_string_literal: true

# class for contact address: 1 - 1
class AddressesController < ApplicationController
  before_action :set_address

  def show
    render json: @address
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    if params[:contact_id]
      @address = Contact.find(params[:contact_id]).address
      return @address
    end
    @address = address.where(id: params[:id])
  end
end
