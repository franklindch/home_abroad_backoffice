class TravelDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel, only: [:edit, :update, :create, :new]

  def new
    @travel_detail = TravelDetail.new
  end

  def create
    @travel_detail = TravelDetail.new(travel_detail_params)
    @travel_detail.travel = @travel
    if @travel_detail.save && @travel_detail.is_correspondence
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to new_travel_detail_correspondence_path(@travel_detail)
    elsif @travel_detail.save && @travel_detail.nature == 'Retour'
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to new_travel_travel_detail_path(@travel_detail)
    elsif @travel_detail.save
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to family_client_path(@travel_detail.travel.language_stay.client.family,  @travel_detail.travel.language_stay.client)
    else
      render :new
    end
  end

  private

  def travel_detail_params
    params.require(:travel_detail).permit(
       :is_correspondence, :mode, :nature, :companies, :u_m, :partner_company_id, :start_date, :end_date, :travel_detail_id, :reference, :start_time, :end_time, :departure_location, :arrival_location
      )
  end

  def retrieve_travel
    @travel ||= Travel.find(params[:travel_id])
  end
end
