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
    puts @json 
    puts "fin get member list"
    puts "j affiche email de json"
    @json.each do |user|
      puts user[:email]
   #   Subscriber.create(email: @json['email'][])
    end
  end

  def update_db_subscriber(json)


  end

  def send_newsletter
    @user.each do |user|
      NewsletterMailer.weekly_newsletter.(user.email).deliver
    end
  end

  def perform
    get_member_list
    #update_subscriber_list
    #send_newsletter
  end

end