# frozen_string_literal: true

class Netkeiba::Orepro::Command
  class AuthenticationError < StandardError;
  end

  delegate_missing_to :@session

  def initialize(session)
    @session = session

    freeze
  end

  def self.login(email:, password:, race_id:)
    url = "https://orepro.netkeiba.com/bet/shutuba.html?race_id=#{race_id}"
    session = Netkeiba::Orepro::Session.new

    session.visit(url)
    session.visit('https://regist.netkeiba.com/account/?pid=login')
    session.find(:xpath, '//*[@id="contents"]/div/form/div/ul/li[1]/input').set(email)
    session.find(:xpath, '//*[@id="contents"]/div/form/div/ul/li[2]/input').set(password)
    session.find(:xpath, '//*[@id="contents"]/div/form/div/div[1]/input').click
    raise AuthenticationError.new('ログインに失敗しました') if session.current_url != url

    Netkeiba::Orepro::Command.new(session)
  end

  def visit_race_page(race_id)
    url = "https://orepro.netkeiba.com/bet/shutuba.html?mode=init&race_id=#{race_id}"
    @session.visit(url)
  end

  def select_kantan_mode
    @session.find(:xpath, '/html/body/div[1]/div[3]/div/div[8]/div/ul/li[2]').click
  end

  def select_kaime_mode
    @session.find(:xpath, '/html/body/div[1]/div[3]/div/div[8]/div/ul/li[4]').click
  end

  def enable_twice_mode
    @session.find(:xpath, '/html/body/div[1]/div[3]/div/div[6]/div/div[1]/label').click
  end

  def refresh
    @session.refresh
  end

  def select_honmei(number)
    @session.find(:xpath, "/html/body/div[1]/div[3]/div/div[5]/div[1]/table/tbody/tr[#{number + 1}]/td[2]/ul/li[1]").click
  end

  def select_taikou(number)
    @session.find(:xpath, "/html/body/div[1]/div[3]/div/div[5]/div[1]/table/tbody/tr[#{number + 1}]/td[2]/ul/li[2]").click
  end

  def select_tanana(number)
    @session.find(:xpath, "/html/body/div[1]/div[3]/div/div[5]/div[1]/table/tbody/tr[#{number + 1}]/td[2]/ul/li[3]").click
  end

  def select_renka(numbers = [])
    numbers.each do |number|
      @session.find(:xpath, "/html/body/div[1]/div[3]/div/div[5]/div[1]/table/tbody/tr[#{number + 1}]/td[2]/ul/li[4]").click
    end
  end

  def submit(race_id)
    @session.find(:xpath, "//*[@id=\"act-bet_#{race_id}\"]").click
  end

  def take_full_page_screenshot(race_id)
    width = @session.page.execute_script("return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);")
    height = @session.page.execute_script("return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")

    window = @session.page.driver.browser.manage.window
    window.resize_to(width + 100, height + 100)

    path = File.join(today, "#{race_id.to_s}.png")
    Dir.mkdir(today) unless Dir.exist?(today)

    @session.save_screenshot(path)
  end

  private

  def today
    (Time.current + 9.hours).strftime('%Y%m%d')
  end
end
