# frozen_string_literal: true

class Api::Netkeiba::Orepro::V1::PredictionsController < ApplicationController
  wrap_parameters false

  def create
    request = Netkeiba::Orepro::Request.new(create_params)
    request.save!
    raise BadRequestError.new(request.error_message) if request.invalid?

    response = Netkeiba::Orepro::Runner.execute(**request.attributes.symbolize_keys)
    render status: 200, json: { status: 200, message: response.screenshot_url }
  end

  private

  def create_params
    params.permit(
      :email,
      :password,
      :race_id,
      :honmei,
      :taikou,
      :tanana,
      :double,
      renkas: []
    )
  end
end
