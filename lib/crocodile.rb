require 'selenium/client'

class Crocodile  

  HOST = "0.0.0.0"
  PORT = 4444
  TIMEOUT = 60

  def self.start
    selenium = Selenium::RemoteControl::RemoteControl.new(HOST, PORT, TIMEOUT)
    selenium.jar_file = File.join(File.dirname(__FILE__), '..', 'vendor', "selenium-server.jar")
    selenium.start :background => true
    TCPSocket.wait_for_service :host => HOST, :port => PORT
  end

  def self.stop
    selenium = Selenium::RemoteControl::RemoteControl.new(HOST, PORT, TIMEOUT)
    selenium.stop
    TCPSocket.wait_for_service_termination :host => HOST, :port => PORT
  end

  def self.snap(host, url, dest, options, &block)
    start if options[:start]
    browser = Selenium::Client::Driver.new( 
      :host => HOST || options[:host],
      :port => PORT || options[:port],
      :timeout_in_second => TIMEOUT || options[:timeout],
      :browser => "*firefox",
      :url => host)
    browser.start_new_browser_session
    browser.open url
    browser.get_eval "window.resizeTo(#{options[:width]},#{options[:height]});" if (options[:width] && options[:height])
    yield if block
    browser.capture_entire_page_screenshot File.join(File.expand_path('.'), dest), ''
    browser.close_current_browser_session    
  ensure
    stop if options[:stop]
  end
end