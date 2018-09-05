# frozen_string_literal: true

module LanguageStayHelper
	def show_the_age_at_language(date_of_birth, language_stay)
		language_stay_start_date = language_stay&.start_date
		language_stay_start_date.year - date_of_birth.year - ((language_stay_start_date.month > date_of_birth.month || (language_stay_start_date.month == date_of_birth.month && language_stay_start_date.day >= date_of_birth.day)) ? 0 : 1)
	end
end