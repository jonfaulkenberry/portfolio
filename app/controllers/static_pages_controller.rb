class StaticPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def contact
    if request.post? && verify_recaptcha
      ContactFormMailer.delay.contact_form_email(params[:sender_name], params[:sender_email], params[:message])
      flash[:notice] = "Your message has been sent!"
      redirect_to root_path
    end
  end
  
  def manage
    raise Pundit::NotAuthorizedError unless !current_user.nil? && current_user.owner?
  end
end
