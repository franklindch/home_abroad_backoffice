class CorrespondencesController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel_detail, only: [:edit, :update, :create, :new]
  before_action :retrieve_correspondence, only: [:edit, :update, :destroy]

  def new
    @correspondence = Correspondence.new
  end

  def create
    @correspondence = Correspondence.new(correspondence_params)
    @correspondence.travel_detail = @travel_detail

    if @correspondence.save && @travel_detail.nature == 'Retour'
      flash[:notice] = "Correspondence ajoutée avec succès !"
      redirect_to family_client_path(@travel_detail.travel.language_stay.client.family,  @travel_detail.travel.language_stay.client)
    elsif @correspondence.save
      flash[:notice] = "Correspondence ajoutée avec succès !"
      redirect_to new_travel_travel_detail_path(@correspondence.travel_detail.travel)
    else
      render :new
    end
  end

  def edit; end

  def update
    @correspondence.update(correspondence_params)
    binding.pry
    if @travel_detail.nature == 'Retour'
      flash[:notice] = "Correspondence éditée avec succès !"
      redirect_to family_client_path(@travel_detail.travel.language_stay.client.family, @travel_detail.travel.language_stay.client)
    else
      flash[:notice] = "Correspondence éditée avec succès !"
      redirect_to edit_travel_travel_detail_path(@travel_detail.travel, @travel_detail.travel.travel_details.where(nature:'Retour').first)
    end
  end

  def destroy
    @correspondence.destroy
    flash[:notice] = 'Correspondence supprimée avec succès'
    redirect_to family_client_path(@language_stay.client.family,  @language_stay.client)
  end

  private

  def correspondence_params
    params.require(:correspondence).permit(
     :start_date, :end_date, :travel_detail_id, :reference, :start_time, :end_time, :departure_location, :arrival_location
    )
  end

  def retrieve_travel_detail
    @travel_detail ||= TravelDetail.find(params[:travel_detail_id])
  end

  def retrieve_correspondence
    @correspondence ||= Correspondence.find(params[:id])
  end
end
