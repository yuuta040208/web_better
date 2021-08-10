# frozen_string_literal: true

class ApplicationController < ActionController::API
  class BadRequestError < StandardError; end

  rescue_from StandardError, with: :internal_server_error
  rescue_from Netkeiba::Orepro::Command::AuthenticationError, with: :unauthorized
  rescue_from BadRequestError, with: :bad_request

  private

  def bad_request(message = nil)
    render status: 400, json: { status: 400, message: "Bad Request. #{message}" }
  end

  def unauthorized(message = nil)
    render status: 401, json: { status: 401, message: "Unauthorized. #{message}" }
  end

  def internal_server_error(message = nil)
    render status: 500, json: { status: 500, message: "Internal Server Error. #{message}" }
  end
end
