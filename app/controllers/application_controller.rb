# frozen_string_literal: true

# main class of a rails project
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  #before_action :ensure_json_request
  #PASSWORD = "3NCR1PT3DP4SSW0RD"
  #def ensure_json_request
  #  return if request.headers['Accept'] =~ /vnd\.api\+json/
  #  render nothing: true, status: 406
  #end
end
