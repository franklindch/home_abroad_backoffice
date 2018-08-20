class GeneratePdfsController < ApplicationController
	def enrollment_form
		language_stay = LanguageStay.find(params[:language_stay])
		GeneratePdf.create.enrollment_form(language_stay)
	end
end
