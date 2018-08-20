# Preview all emails at http://localhost:3000/rails/mailers/client_mailer
class ClientMailerPreview < ActionMailer::Preview
	def send_language_stay_feedback
		language_stays = LanguageStay.where(end_date: Time.now.beginning_of_week..Time.now.end_of_week)
		if language_stays.any?
			language_stays.each do |language_stay|
	   			ClientMailer.with(language_stay: language_stay, client: language_stay.client).send_language_stay_feedback.deliver_now
			end
		end
	 end
end
