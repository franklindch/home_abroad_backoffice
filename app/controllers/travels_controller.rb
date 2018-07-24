class TravelsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel, only: [:edit, :update, :destroy, :show]

  def new
    @travel = Travel.new
    2.times do
      @travel.travel_details.build
    end
  end

  def create
    @travel = Travel.new(travel_params)
    retrieve_attendant
    @travel.attendant = @attendant
    if @travel.save
      @travel_attendants = TravelAttendant.create!(travel_id: @travel.id, attendant_id: @attendant.id)
      # @travel.travel_details.first.update_columns(type: 0)
      # @travel.travel_details.second.update_columns(type: 1)
      redirect_to travels_path
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
    @travels = Travel.order(:reference).page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
    if params[:query].present?
      @travels = Travel.search_by_reference(params[:query]).page params[:page]
    else
      @travels = Travel.order(:reference).page params[:page]
    end
  end

  private

  def travel_params
    params.require(:travel).permit(
      :capacity, :travel_code, :attendant_id,
      travel_details_attributes: [:id, :reference, :type, :correspondence, :mode, :meeting_time, :start_time, :end_time, :departure_location, :arrival_location, :partner_company_id, :travel_id, :_destroy]
    )    
  end

  def retrieve_travel
    @travel ||= Travel.find(params[:id])
  end

  def retrieve_attendant
    @attendant ||= Attendant.find(params[:travel][:attendant_id])
  end
end
