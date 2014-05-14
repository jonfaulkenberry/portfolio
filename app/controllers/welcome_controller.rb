class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def contact
    if request.post?  
      ContactFormMailer.delay.contact_form_email(params[:sender_name], params[:sender_email], params[:message])
      flash[:notice] = "Your message has been sent!"
      redirect_to root_path
    end
  end
end
