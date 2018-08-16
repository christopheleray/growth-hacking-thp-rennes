require 'dotenv'
Dotenv.load

class NewsletterMailer < ApplicationMailer

  def weekly_newsletter
    mail( from: 'thprennes@gmail.com',
      to: "christophe.leray1@gmail.com", 
      subject: 'Apprends à coder gratuitement autour de chez toi!'
      )
  end
end
