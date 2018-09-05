class TransitsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_travel, only: [:new, :create, :edit, :update, :destroy, :show]
	before_action :retrieve_transit, only: [:edit, :update, :destroy, :show]

	def new
	  @transit = Transit.new
	end

	def create
	  @transit = Transit.new(transit_params)
	  client = @travel.language_stay.client
	  if @transit.save
	  	@travel.transits << @transit
	    # transitMailer.with(transit: @transit).welcome_email.deliver_now
	    redirect_to client_path(client)
	    flash[:notice] = "Acheminement ajouté avec succès !"
	  else
	    render :new
	  end
	end

	def edit; end

	def update
	  @transit.update(transit_params)
	  # redirect_to families_path
	end

	def destroy
	  @transit.destroy
	  redirect_to families_path
	end

	private

	def retrieve_travel
		@travel ||= Travel.find(params[:travel_id])
	end

	def transit_params
	  params.require(:transit).permit(
	    :nature, :start_time, :end_time, :mode, :departure_location, :arrival_location, :start_date, :end_date, :reference, :partner_company
	  )
	end
end
