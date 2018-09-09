class LanguageStaysController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_client, only: [:new, :edit, :update, :destroy, :create]
	before_action :retrieve_language_stay, only: [:edit, :update, :destroy]

	def new
	  @language_stay = LanguageStay.new
	end

	def create
	  @language_stay = LanguageStay.new(language_stay_params)
	  @language_stay.client = @client
	  @s = @language_stay.start_date
	  @e = @language_stay.end_date
	  @language_stay.duration = @language_stay.get_duration(@e, @s)

	  if @language_stay.save
	  	flash[:notice] = "Séjour ajouté avec succès !"
	    redirect_to client_path(@client)
	  else
	  	flash[:alert] = 'Merci de lire les messages d\'erreur'
	    render :new
	  end
	end

	def edit; end

	def update
	  @language_stay.update(language_stay_params)
	  redirect_to client_path(@client)
	end

	def destroy
	  @language_stay.destroy
	  redirect_to client_path(@client)
	end

	
	def enrollment_form
		@language_stay = LanguageStay.find(params[:language_stay])
	  	generate_enrollment_form_pdf(@language_stay)
		fields_filled(@language_stay)
	end

	def certificate
		@language_stay = LanguageStay.find(params[:language_stay])
	  	generate_language_stay_certificate_pdf(@language_stay)
	end

	private

	def fields_filled(language_stay)
		if language_stay.all_attributes?
			flash[:notice] = 'Tous les champs du séjour ont été remplis'
		else
			flash[:alert] = 'Il reste sûrement des informations à compléter sur le séjour'
		end
	end

	def retrieve_client
		@client ||= Client.find(params[:client_id])
	end

	def retrieve_language_stay
		@language_stay ||= LanguageStay.find(params[:id])
	end

	def language_stay_params
	  params.require(:language_stay).permit(
	    :transfers, :room, :data_entry_responsible, :intl_number, :commercial_responsible, :precisions, :duration, :activities, :fee, :travel_id, :program_id, :phone_during_stay, :start_date, :end_date, :location, :pension, :accomodation, :option_1, :option_2, :class_hours,:partner_company_id, :client_id, :invoice_id
	  )    
	end

	def date_format(language_stay_params, date)
	  {
	    day: language_stay_params["#{date}(3i)"].to_i,
	    month: language_stay_params["#{date}(2i)"].to_i,
	    year: language_stay_params["#{date}(1i)"].to_i
	  }
	end
end
