class ClientsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	before_action :retrieve_client, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_family, only: [:update, :create]

	def new
		@families = Family.all
		if params[:child_detail_id]
			search_for_child_detail
		else
			@client = Client.new
		end
	end

	def create
	  @client = Client.new(client_params)
	  @client.family = @family
	  if @client.save
			# ClientMailer.with(client: @client).send_language_stay_feedback.deliver_later
		  flash[:notice] = "Client ajouté avec succès !"
		  redirect_to new_client_language_stay_path(@client)
		else
			flash[:alert] = "Merci de lire les messages d'erreurs."
			render :new
		end
	end

	def edit; end

	def update
	  if @client.update(client_params)
	  	flash[:notice] = "Client édité avec succès !"
	  	redirect_to client_path(@client)
	  else
	  	flash[:notice] = "Merci de lire les messages d'erreurs."
	  	render :edit
	  end
	end

	def destroy
	 	@client.destroy
	 	redirect_to clients_path
	end

	def index
		@clients = Client.order(:last_name).page params[:page]
		respond_to do |format|
			format.html
	    format.js
	  end	
	  if params[:query].present?
	    @clients = Client.search_by_full_name(params[:query]).page params[:page]
	  else
	    @clients = Client.order(:last_name).page params[:page]
	  end
	end

	def show; end

	private

	def search_for_child_detail
		@child_detail = ChildDetail.find(params[:child_detail_id])
		@child_detail.update_columns(client: true)
		@family = @child_detail.qualification.family
		# @child_detail.qualification.check_if_family_is_client?
	  @client = Client.new(
	  	family: @family, first_name: @child_detail.first_name, 
	  	last_name: @child_detail.last_name, 
	  	gender: @child_detail.gender, 
	  	email: @child_detail.email,
	  	school: @child_detail.school,
	  	school_grade: @child_detail.school_grade
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
		@family ||= Family.retrieve_family(params[:client][:family_id])
	end

	def client_params
	  params.require(:client).permit(
	  	:age_category, :gender, :intl_number, :address_1, :address_2, :zip_code, :passport_expiration_date, :first_name, :last_name, :birth_date, :email, :phone_number, :passport_number, :country_of_issue, :nationality, :first_language_level, :second_language_level, :first_language, :second_language, :preferred_hobbies, :smoker, :medical_issue, :comment, :family_id
	  )
	end
end