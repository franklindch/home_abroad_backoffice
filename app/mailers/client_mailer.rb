class ClientMailer < ApplicationMailer
	before_action { @language_stay = params[:language_stay] }
  before_action { @client = params[:client] }

	
	default to: -> { @client.email },
	        from:  -> { 'notifications@example.com' }

	def send_language_stay_feedback
    mail(subject: "Qu'avez-vous pensé de votre séjour #{@client.first_name} ? pour le séjour #{@language_stay.end_date}")
	end

	# def returned_client
	# 	language_stays = LanguageStay.where(end_date: Time.now.beginning_of_week..Time.now.end_of_week)
	# 	if language_stays.any?
	# 		language_stays.map do |language_stay|
	# 			@attr_reader :attr_nameseturned_client << client = language_stay.client
	# 		end
	# 		return @returned_clients 
	# 	end
	# end
end
