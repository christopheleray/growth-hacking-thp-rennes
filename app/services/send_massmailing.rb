
class SendMassmailing
  attr_accessor :user

  def initialize
    @user = Depute.all 
  end

  def send_email
    @user.each do |user|
      DeputeMailer.welcome_email(user.email).deliver
    end
  end

  def perform
    send_email
  end

end