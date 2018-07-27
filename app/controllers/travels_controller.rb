class TravelsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel, only: [:edit, :update, :destroy, :show]
  before_action :retrieve_travel_group, only: [:edit, :update, :destroy, :show]

  def new
    @travel = Travel.new
    @travel_detail_aller = @travel.travel_details.build
    @correspondence_aller = @travel_detail_aller.correspondences.build
    @travel_detail_retour = @travel.travel_details.build
    @correspondence_retour = @travel_detail_retour.correspondences.build
  end

  def create
    @travel = Travel.new(travel_params)
    while params[:travel_group_id]
      retrieve_travel_group
      @travel.travel_group_id = @travel_group
    end
    @language_stays = LanguageStay.all
    if @travel.save
      if params[:language_stay_id]
        retrieve_language_stay
        client = @language_stay.client
        @invoice.language_stay = @language_stay
        redirect_to client_path(client)
      else
        retrieve_attendant
        @travel.attendant_id = @attendant
        @travel.update_columns(attendant_id: @attendant.id)
        redirect_to travels_path
      end
    else
      render :new
    end
  end


  def edit
  end

  def update
  end


  def destroy
  end

  def index
    @travels = Travel.order(:travel_code).page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
    if params[:query].present?
      @travels = Travel.search_by_travel_code(params[:query]).page params[:page]
    else
      @travels = Travel.order(:travel_code).page params[:page]
    end
  end

  private

  def travel_params
    params.require(:travel).permit(:capacity, :travel_code, :attendant_id, :nature, :language_stay_id, :travel_group_id, travel_details_attributes: [:id, :reference, :nature, :is_correspondence, :mode, :meeting_time, :start_time, :end_time, :departure_location, :arrival_location, :partner_company_id, :travel_id, :_destroy, correspondences_attributes: [:id, :reference, :start_time, :end_time, :departure_location, :arrival_location, :travel_detail_id, :_destroy]])    
  end

  def retrieve_travel
    @travel ||= Travel.find(params[:id])
  end

  def retrieve_language_stay
    @language_stay ||= LanguageStay.find(params[:language_stay_id])
  end

  def retrieve_attendant
    @attendant ||= Attendant.find(params[:travel][:attendant_id])
  end

  def retrieve_travel_group
    @travel_group ||= Travel.find(params[:travel_group_id])
  end
end
