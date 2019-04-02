class TravelGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel_group, only: [:edit, :update, :destroy, :show]
  before_action :retrieve_attendants, only: [:create, :update]

  def new
    @travel_group = TravelGroup.new
  end

  def create
    @travel_group = TravelGroup.new(travel_group_params)
    # binding.pry
    if @travel_group.save
      flash[:notice] = "Voyage créé avec succès !"
      @travel_group.update(attendant_ids: @attendants)
      redirect_to new_travel_group_travel_detail_path(@travel_group)
    else
      flash[:alert] = "Merci de lire les messages d'erreur."
      render :new
    end
  end

  def show
    @off_set_travel = OffSetTravel.find(params[:off_set_travel_id]) if params[:off_set_travel_id]
  end

  def edit; end

  def update
    @travel_group.update(travel_group_params)
    @travel_group.update(attendant_ids: @attendants)
    flash[:notice] = "Voyage édité avec succès !"
    redirect_to edit_travel_group_travel_detail_path(@travel_group, @travel_group.travel_details.first)
  end


  def destroy
    @travel_group.destroy
    redirect_to travel_groups_path
  end

  def airport_convocation
    @travel_group = TravelGroup.find(params[:travel_group])
    generate_airport_convocation_pdf(@travel_group)
    # fields_filled(@language_stay)
  end

  def index
    @travel_groups = TravelGroup.order(:travel_code).page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
    if params[:query].present?
      @travel_groups = TravelGroup.search_by_travel_code(params[:query]).page params[:page]
    else
      @travel_groups = TravelGroup.order(:travel_code).page params[:page]
    end
  end

  private

  def uniqu_travel_group?(travel)
    if travel.uniqu_travel_group
      flash[:alert] = 'Vous ne pouvez pas ajouter le même voyage de groupe 2 fois à un séjour'
    end
  end

  def travel_group_params
    params.require(:travel_group).permit(:season, :capacity, :attendant_ids, :travel_code, :language_stay_id)
  end

  def retrieve_travel_group
    @travel_group ||= TravelGroup.find(params[:id])
  end

  def retrieve_language_stay
    @language_stay ||= LanguageStay.find(params[:language_stay_id]) if params[:language_stay_id]
  end

  def retrieve_attendants
    @attendants ||= params[:travel_group][:attendant_ids].delete_if {|id| id == ""}
  end
end
