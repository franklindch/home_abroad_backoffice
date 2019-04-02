class TravelDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_travel, only: [:edit, :update, :create, :new], unless: :travel_group_new_origin?
  before_action :retrieve_travel_group, only: [:edit, :update, :create, :new], if: :travel_group_new_origin?
  before_action :retrieve_travel_detail, only: [:edit, :update, :destroy]

  def new
    @travel_detail = TravelDetail.new
  end

  def travel_group_new_origin?
    params[:travel_group_id]
  end

  def create
    @travel_detail = TravelDetail.new(travel_detail_params)
    if params[:travel_group_id]
      @travel_detail.travel_group = @travel_group
      if params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Aller' && @travel_group.travel_details.where(nature:'Aller').any?
        flash[:notice] = "Voyage Aller déjà ajouté ! "
        render :new
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Aller' && @travel_group.travel_details.where(nature:'Aller').any?
        flash[:notice] = "Voyage Aller déjà ajouté ! "
        render :new
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to new_travel_detail_correspondence_path(@travel_detail)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to new_travel_group_travel_detail_path(@travel_group)
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to new_travel_detail_correspondence_path(@travel_detail)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to travel_groups_path
      else
        render :new
      end
    else
      @travel_detail.travel = @travel
      if params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Aller' && @travel.travel_details.where(nature:'Aller').any?
        flash[:notice] = "Voyage Aller déjà ajouté ! "
        render :new
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Aller' && @travel.travel_details.where(nature:'Aller').any?
        flash[:notice] = "Voyage Aller déjà ajouté ! "
        render :new
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to new_travel_detail_correspondence_path(@travel_detail)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to new_travel_travel_detail_path(@travel)
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to new_travel_detail_correspondence_path(@travel_detail)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.save
        flash[:notice] = "Voyage ajouté avec succès !"
        redirect_to family_client_path(@travel.language_stay.client.family,  @travel.language_stay.client)
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    if @travel_group
      if params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to edit_travel_detail_correspondence_path(@travel_detail, @travel_detail.correspondences.first)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to edit_travel_group_travel_detail_path(@travel_group, @travel_group.travel_details.where(nature:'Retour').first)
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to edit_travel_detail_correspondence_path(@travel_group.travel_details.where(nature:'Retour').first, @travel_group.travel_details.where(nature:'Retour').first.correspondences.first)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to travel_groups_path
      else
        render :edit
      end
    else
      if params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to edit_travel_detail_correspondence_path(@travel_detail, @travel_detail.correspondences.first)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Aller'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to edit_travel_travel_detail_path(@travel, @travel.travel_details.where(nature:'Retour').first)
      elsif params[:travel_detail][:is_correspondence] == 'true' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to edit_travel_detail_correspondence_path(@travel.travel_details.where(nature:'Retour').first, @travel.travel_details.where(nature:'Retour').first.correspondences.first)
      elsif params[:travel_detail][:is_correspondence] == 'false' && params[:travel_detail][:nature] == 'Retour'
        @travel_detail.update(travel_detail_params)
        flash[:notice] = "Voyage édité avec succès !"
        redirect_to family_client_path(@travel.language_stay.client.family,  @travel.language_stay.client)
      else
        render :edit
      end
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

  def retrieve_travel_group
    @travel_group ||= TravelGroup.find(params[:travel_group_id])
  end


  def retrieve_travel_detail
    @travel_detail ||= TravelDetail.find(params[:id])
  end
end
