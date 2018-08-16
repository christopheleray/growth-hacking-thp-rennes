class DeputeMailer < ApplicationMailer

require 'dotenv'
Dotenv.load

  def welcome_email(user)
    mail( from: 'thprennes@gmail.com',
      to: user, 
      subject: 'Apprendre le code gratuitement',
      )
  end
end
