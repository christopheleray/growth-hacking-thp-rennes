class DeputeMailer < ApplicationMailer

require 'dotenv'
Dotenv.load

  def welcome_email
    mail( from: 'tphrennes@gmail.com',
      to: 'christophe.leray1@gmail.com', 
      subject: 'Apprendre le code gratuitement',
      )
  end

end
