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
	    redirect_to client_path(client)
      flash[:notice] = "Acheminement ajouté avec succès !"
    else
      render :new
    end
  end

  def edit; end

  def update
    client = @travel.language_stay.client
    @transit.update(transit_params)
    flash[:notice] = "Acheminement édité avec succès !"
    redirect_to client_path(client)
    # redirect_to families_path
  end

  def destroy
    client = @travel.language_stay.client
    @transit.destroy
	  flash[:notice] = "Acheminement supprimé avec succès !"
	  redirect_to client_path(client)
	end

	private

	def retrieve_travel
		@travel ||= Travel.find(params[:travel_id])
	end

  def retrieve_transit
    @transit ||= Transit.find(params[:id])
  end

	def transit_params
	  params.require(:transit).permit(
	    :nature, :start_time, :end_time, :mode, :departure_location, :arrival_location, :start_date, :end_date, :reference, :partner_company
	  )
	end
end
