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
	  if @language_stay.save
	    redirect_to client_path(@client)
	  else
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

	private

	def retrieve_client
		@client ||= Client.find(params[:client_id])
		
	end

	def retrieve_language_stay
		@language_stay ||= LanguageStay.find(params[:id])
		
	end

	def language_stay_params
	  params.require(:language_stay).permit(
	    :data_entry_responsible, :commercial_responsible, :duration, :activities, :fee, :travel_id, :program_id, :client_id, :invoice_id
	  )    
	end
end
