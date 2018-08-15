class DeputeMailer < ApplicationMailer

require 'dotenv'
Dotenv.load

  def welcome_email
    users = Depute.all
    users.each do |user|
    mail( from: 'thprennes@gmail.com',
      to: user.email, 
      subject: 'Apprendre le code gratuitement',
      )
    end
  end
end
