class FamilyMailer < ApplicationMailer
	layout 'home_abroad_header'
	default from: 'notifications@example.com'
	 
  def welcome_email
    @family = params[:family]
    @url  = 'http://example.com/login'
    mail(to: @family.email, subject: 'Welcome to My Awesome Site')
  end
end
