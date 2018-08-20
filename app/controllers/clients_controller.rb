class ClientsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	before_action :retrieve_client, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_family, only: [:update, :destroy, :create]

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
	  birth_date_format = @client.associate_age(params[:client])
	  @client.age = @client.get_age(birth_date_format)
	  # binding.pry

	  if @client.save
			ClientMailer.with(client: @client).send_language_stay_feedback.deliver_later
	  	check_if_family_is_client?(@family.qualification)
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
	  redirect_to client_path(@client)
	end

	def destroy
	 	@client.destroy
	 	respond_to do |format|
	 	  format.js { redirect_to clients_path }
	 	end
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

	# def check_if_family_is_client?(qualification)
	# 	qualification.update_columns(status: 'Cliente') if qualification.child_details { |child_detail| child_detail.client = true }
	# end

	def search_for_child_detail
		@child_detail = ChildDetail.find(params[:child_detail_id])
		@child_detail.update_columns(client: true)
		@family = @child_detail.qualification.family
		@child_detail.qualification.check_if_family_is_client?
	  @client = Client.create!(family: @family, first_name: @child_detail.first_name, last_name: @child_detail.last_name, age: @child_detail.age, gender: @child_detail.gender)
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
	  	:age_category, :gender, :address_1, :address_2, :zip_code, :passport_expiration_date, :first_name, :last_name, :birth_date, :age, :email, :phone_number, :passport_number, :country_of_issue, :nationality, :first_language_level, :second_language_level, :first_language, :second_language, :preferred_hobbies, :smoker, :medical_issue, :comment, :family_id
	  )
	end
end