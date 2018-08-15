# Preview all emails at http://localhost:3000/rails/mailers/depute_mailer
class DeputeMailerPreview < ActionMailer::Preview

  def contact
    DeputeMailer.contact()
  end

end
