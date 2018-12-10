class ClientsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	before_action :retrieve_client, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_family, only: [:update, :create]

	def new
		@families = Family.all
		if params[:child_detail_id]
			search_for_child_detail
		elsif params[:family_id]
      @family = Family.find(params[:family_id])
			@client = Client.new(family: @family)
    else
      @client = Client.new
		end
	end

	def create
	  @client = Client.new(client_params)
	  @client.family = @family
    if @client.save
      retrieve_child_detail && @child_detail.update_columns(status: 'Client') if params[:child_detail_id]
      @client.update_columns(last_name: @family.name)
		  flash[:notice] = "Client ajouté avec succès !"
		  redirect_to new_client_language_stay_path(@client)
		else
			flash[:alert] = "Merci de lire les messages d'erreurs."
			render :new
		end
	end

	def edit; end

	def update
    @client.update(client_params)
    flash[:notice] = "Client édité avec succès !"
    redirect_to client_path(@client)
  end

  def destroy
    @client.destroy
  	flash[:notice] = "Client supprimé avec succès !"
	 	redirect_to clients_path
	end

	def index
		@clients = Client.none
		respond_to do |format|
			format.html
	    format.js
	  end
	  if params[:query].present?
	    @clients = Client.search_by_full_name(params[:query]).page params[:page]
	  else
	    @clients = Client.none
	  end
	end

	def show; end

  def download
    @clients = Client.all
    respond_to do |format|
      format.html
      format.xlsx { render filename: "Clients au #{Date.today}" }
    end
  end

	private

	def search_for_child_detail
		@child_detail = ChildDetail.find(params[:child_detail_id])
		@family = @child_detail.qualification.family
	  @client = Client.new(
	  	family: @family,
	  	first_name: @child_detail.first_name,
	  	last_name: @child_detail.last_name,
	  	gender: @child_detail.gender,
	  	email: @child_detail.email,
	  	school: @child_detail.school,
	  	school_grade: @child_detail.school_grade,
      birth_date: @child_detail.birth_date
	  )
	  respond_to do |format|
	    format.html # new.html.erb
	    format.xml  { render xml: @client }
	  end
	end

	def retrieve_client
	  @client ||= Client.find(params[:id])
	end

	def retrieve_family
		@family ||= Family.retrieve_family(params[:client][:family_id], params[:family_id])
	end

	def retrieve_child_detail
		@child_detail ||= ChildDetail.find(params[:child_detail_id])
	end

	def client_params
	  params.require(:client).permit(
	  	:country, :city, :school, :school_grade, :season, :status, :age_category, :gender, :intl_number, :address_1, :address_2, :zip_code, :passport_expiration_date, :first_name, :last_name, :birth_date, :email, :phone_number, :passport_number, :country_of_issue, :nationality, :first_language_level, :second_language_level, :first_language, :second_language, :preferred_hobbies, :smoker, :medical_issue, :comment, :family_id
	  )
	end
end
