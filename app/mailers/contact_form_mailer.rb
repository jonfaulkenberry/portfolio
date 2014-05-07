class ContactFormMailer < ActionMailer::Base
  def contact_form_email(sender_name, sender_email, message)
    @sender_name = sender_name
    @sender_email = sender_email
    @message = message
      mail(
        :subject => 'Message from JonFaulkenberry.com',
        :to      => 'jon@jonfaulkenberry.com',
        :from    => 'jon@jonfaulkenberry.com',
        :tag     => 'contact-form-email'
      )
    end
end
