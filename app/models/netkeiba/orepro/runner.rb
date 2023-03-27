# frozen_string_literal: true

class Netkeiba::Orepro::Runner
  def self.execute(email:, password:, race_id:, honmei:, taikou:, tanana:, renkas:, double: false)
    command = Netkeiba::Orepro::Command.login(
      email: email,
      password: password,
      race_id: race_id
    )

    command.visit_race_page(race_id)
    command.select_kaime_mode
    command.select_renka(renkas) if renkas.present?
    command.select_tanana(tanana) if tanana.present?
    command.select_taikou(taikou) if taikou.present?
    command.select_honmei(honmei)
    command.enable_twice_mode if double

    command.submit(race_id)

    sleep(5)

    screenshot_path = command.take_full_page_screenshot(race_id)

    Netkeiba::Orepro::Response.new(screenshot_path)
  end
end