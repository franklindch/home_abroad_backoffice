class TravelDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel, only: [:edit, :update, :create, :new]
  before_action :retrieve_travel_detail, only: [:edit, :update, :destroy]

  def new
    @travel_detail = TravelDetail.new
  end

  def create
    @travel_detail = TravelDetail.new(travel_detail_params)
    @travel_detail.travel = @travel
    # binding.pry
    if params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Aller'
      @travel_detail.save
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to new_travel_detail_correspondence_path(@travel_detail)
    elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Retour'
      @travel_detail.save
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to new_travel_detail_correspondence_path(@travel_detail)
    elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Retour'
      @travel_detail.save
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to new_travel_travel_detail_path(@travel)
    elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Aller'
      @travel_detail.save
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to new_travel_travel_detail_path(@travel)
    elsif
      @travel_detail.save
      flash[:notice] = "Voyage ajouté avec succès !"
      redirect_to family_client_path(@travel.language_stay.client.family,  @travel.language_stay.client)
    else
      render :new
    end
  end

  def edit; end

  def update
    @travel_detail.update(travel_detail_params)
    if @travel_detail.correspondences.any?
      @travel_detail = @travel.travel_details.find_by_nature('Retour')
      flash[:notice] = 'Voyage édité avec succès'
      redirect_to edit_travel_detail_correspondence_path(@travel_detail, @travel_detail.correspondences.first)
    else
      redirect_to edit_travel_travel_detail_path(@travel, @travel_detail)
    end
  end

  def destroy
    @travel.destroy
    flash[:notice] = 'Voyage supprimé avec succès'
    redirect_to family_client_path(@language_stay.client.family,  @language_stay.client)
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

  def retrieve_travel_detail
    @travel_detail ||= TravelDetail.find(params[:id])
  end
end
