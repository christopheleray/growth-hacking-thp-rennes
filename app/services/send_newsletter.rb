require 'uri'
require 'json'
require 'net/http'
require 'dotenv'
require 'mailchimp'

Dotenv.load

class SendNewsletter
  attr_accessor :mailchimp

  def initialize
    @mailchimp = Mailchimp::API.new('6576586af43be783fc042c3dcb544424-us19')
  end

  def get_member_list
    puts "get member list"
    @json = mailchimp.lists.members('7b033f50e2')[:'data']
    puts @json 
    puts "fin get member list"
    @json.each do 
      puts @json['email']['email']
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