class TravelsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_travel, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_language_stay, only: [:new, :create, :edit, :update, :destroy]

	def new
	  @travel = Travel.new
	end

	def create
	  @travel = Travel.new(travel_params)
    @travel.language_stay = @language_stay

    if params[:travel][:travel_group_id] != ""
    	retrieve_travel_group
    	@travel.travel_group = @travel_group
    end

    client = @language_stay.client
    if @travel.save
    	if @travel.nature == 'Groupe_décalé'
        flash[:notice] = 'Voyage Groupe décalé ajouté avec succès'
        redirect_to new_travel_off_set_travel_path(@travel)
      elsif @travel.nature == 'Groupe'
        flash[:notice] = 'Voyage Groupe ajouté avec succès'
        redirect_to family_client_path(client.family, client)
      else
        flash[:notice] = 'Voyage ajouté avec succès'
        redirect_to new_travel_travel_detail_path(@travel)
      end
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @travel.update(travel_params)
    if @travel.nature == 'Groupe'
      flash[:notice] = 'Voyage Groupe du client édité avec succès'
      redirect_to family_client_path(@travel.language_stay.client.family, @travel.language_stay.client)
    else
      @travel_detail = @travel.travel_details.find_by_nature('Aller')
      flash[:notice] = 'Voyage édité avec succès'
      redirect_to edit_travel_travel_detail_path(@travel,@travel_detail)
    end
  end

  def destroy
    @travel.destroy
    flash[:notice] = 'Voyage supprimé avec succès'
    redirect_to family_client_path(@language_stay.client.family,  @language_stay.client)
	end

	private

	def travel_params
	  params.require(:travel).permit(
      :nature, :language_stay_id, :travel_group_id
	  )
	end

	def retrieve_language_stay
		@language_stay ||= LanguageStay.find(params[:language_stay_id])
	end

	def retrieve_travel
		@travel ||= Travel.find(params[:id])
	end

	def retrieve_travel_group
		@travel_group ||= TravelGroup.find(params[:travel][:travel_group_id])
	end
end
