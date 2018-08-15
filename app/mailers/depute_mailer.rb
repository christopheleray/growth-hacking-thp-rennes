class DeputeMailer < ApplicationMailer

require 'dotenv'
Dotenv.load

  def welcome_email
    user = Depute.all
    user.each do 
    mail( from: 'thprennes@gmail.com',
      to: user.email, 
      subject: 'Apprendre le code gratuitement',
      )
    end
  end
end
