# frozen_string_literal: true

class Netkeiba::Orepro::Response
  def initialize(screenshot_path)
    @screenshot_path = screenshot_path

    freeze
  end

  def screenshot_url
    File.join('http://localhost:3000', @screenshot_path.split('/').last)
  end
end