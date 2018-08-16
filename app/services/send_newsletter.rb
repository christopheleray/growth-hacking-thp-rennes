require 'uri'
require 'json'
require 'net/http'
require 'dotenv'
require 'mailchimp'

Dotenv.load

class SendNewsletter
  attr_accessor :mailchimp

  def initialize
    @mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
  end

  def get_member_list
    puts "get member list"
    @json = mailchimp.lists.members(ENV['MAILCHIMP_LIST_ID'])['data']
    puts "fin get member list"
    puts "j affiche email de json"
    @json.each do |user|
       temp_user = user["email"]
        send_newsletter(temp_user)
    end
  end

  def send_newsletter(user)
      NewsletterMailer.weekly_newsletter(user).deliver
  end

  def perform
    get_member_list
  end

end