class ClientMailer < ApplicationMailer
	before_action { @language_stay = params[:language_stay] }
  before_action { @client = params[:client] }


	default to: -> { @client.email },
	        from:  -> { 'notifications@example.com' }

	def send_language_stay_feedback
    mail(subject: "Qu'avez-vous pensé de votre séjour #{@client.first_name} ? pour le séjour #{@language_stay.end_date}")
	end
end
