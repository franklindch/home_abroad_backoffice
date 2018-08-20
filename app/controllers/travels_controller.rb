class TravelsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel, only: [:edit, :update, :destroy, :show]
  before_action :retrieve_travel_group, only: [:update, :show]
  before_action :retrieve_language_stay, only: [:new, :edit, :update, :destroy, :create]


  def new
    @travel = Travel.new
    @travel_detail_aller = @travel.travel_details.build
    @correspondence_aller = @travel_detail_aller.correspondences.build
    @travel_detail_retour = @travel.travel_details.build
    @correspondence_retour = @travel_detail_retour.correspondences.build
  end

  def create
    @travel = Travel.new(travel_params)

    if params[:language_stay_id]
      @travel.language_stay = @language_stay
      client = @language_stay.client
    else
      retrieve_attendant
      @travel.attendant = @attendant
    end

    @travel_nature = params[:travel][:nature]

    if @travel_nature == 'Groupe'
      retrieve_travel_group
      uniqu_travel_group?(@travel)
      @travel.travel_group_id = @travel_group.id
    elsif @travel_nature == 'Pré_acheminement'

    end

    if @travel.save
      flash[:notice] = "Voyage créé avec succès !"
      if params[:language_stay_id]
        redirect_to client_path(client)
      else
      redirect_to travels_path
      end
    else
      flash[:alert] = "Merci de lire les messages d'erreur !"
      render :new
    end
  end


  def edit; end

  def update
    @travel.update(travel_params)
    redirect_to travels_path
  end


  def destroy
    @travel.destroy
    redirect_to travels_path
  end

  def airport_convocation
    @travel_group = Travel.where(nature: "Groupe").find(params[:travel_group])
    generate_airport_convocation_pdf(@travel_group)
    # fields_filled(@language_stay)
  end

  def index
    @travels = Travel.where(nature: 'Groupe').order(:travel_code).page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
    if params[:query].present?
      @travels = Travel.where(nature: 'Groupe').search_by_travel_code(params[:query]).page params[:page]
    else
      @travels = Travel.where(nature: 'Groupe').order(:travel_code).page params[:page]
    end
  end

  private

  def uniqu_travel_group?(travel)
    if travel.uniqu_travel_group
      flash[:alert] = 'Vous ne pouvez pas ajouter le même voyage de groupe 2 fois à un séjour'
    end
  end

  def travel_params
    params.require(:travel).permit(:capacity, :acheminement, :travel_code, :attendant_id, :nature, :language_stay_id, :travel_group_id, 
      travel_details_attributes: [
        :id, :reference, :companies, :nature, :is_correspondence, :mode, :meeting_time, :start_time, :end_time, :departure_location, :arrival_location, :partner_company_id, :travel_id, :_destroy, 
        correspondences_attributes: [
          :id, :reference, :start_time, :end_time, :departure_location, :arrival_location, :travel_detail_id, :_destroy
        ]
      ]
    )    
  end

  def retrieve_travel
    @travel ||= Travel.find(params[:id])
  end

  def retrieve_language_stay
    @language_stay ||= LanguageStay.find(params[:language_stay_id]) if params[:language_stay_id]
  end

  def retrieve_attendant
    @attendant ||= Attendant.find(params[:travel][:attendant_id])
  end

  def retrieve_travel_group
    @travel_group ||= Travel.find(params[:travel][:travel_group_id])
  end
end
