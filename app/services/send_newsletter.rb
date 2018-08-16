require 'uri'
require 'json'
require 'net/http'
require 'dotenv'
Dotenv.load

class SendNewsletter
  attr_accessor :subscriber

  def initialize

  end

  def update_subscriber_list
    mailchimp_api_key =  ENV['MAILCHIMP_API_KEY']
    url  = URI("")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    @body = JSON.parse(response.read_body)
    MovieResult.delete_all
  end

  def send_newsletter
    @user.each do |user|
      NewsletterMailer.weekly_newsletter.(user.email).deliver
    end
  end

  def perform
    update_subscriber_list
    send_newsletter
  end

end