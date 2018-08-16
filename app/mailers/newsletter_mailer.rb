require 'dotenv'
Dotenv.load

class NewsletterMailer < ApplicationMailer

  def weekly_newsletter(user)
    mail( from: 'thprennes@gmail.com',
      to: user, 
      subject: 'Apprends à coder gratuitement autour de chez toi!'
      )
  end
end
