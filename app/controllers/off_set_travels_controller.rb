class OffSetTravelsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_off_set_travel, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_travel, only: [:new, :create, :edit, :update, :destroy, :show]

	def new
		@off_set_travel = OffSetTravel.new
		@correspondence = @off_set_travel.correspondences.build
	end

	def create
		# binding.pry
		@off_set_travel = OffSetTravel.new(off_set_travel_params)
		@off_set_travel.travel = @travel
		client = @travel.language_stay.client
		if @off_set_travel.save
			flash[:notice] = "Voyage Groupe décalé ajouté avec succès !"
		  redirect_to family_client_path(client.family, client)
		else
			flash[:alert] = "Merci de lire les messages d\'erreur"
			render :new
		end
	end

	private

	def retrieve_off_set_travel
		@off_set_travel ||= OffSetTravel.find(params[:id])
	end

	def off_set_travel_params
		params.require(:off_set_travel).permit(
			:nature, :mode, :is_correspondence, :departure_location, :arrival_location, :start_time, :end_time, :start_date, :end_date, :meeting_time, :reference, :partner_company_id,
			correspondences_attributes: [
			  :id, :reference, :start_time, :end_time, :departure_location, :arrival_location, :off_set_travel_id, :start_date, :end_date, :_destroy
			]
		)
	end

	def retrieve_travel
		@travel ||= Travel.find(params[:travel_id])
	end
end