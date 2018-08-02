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
	  associate_age(client_params)

	  if @client.save
		  @family.qualification.update_columns(status: "Cliente")
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

	def show
	  respond_to do |format|
	    format.html
	    format.pdf do
	      render pdf: "#{@client.name}",
	             template: 'pdf/invoice.html.slim',
	             disposition: 'attachment',
	             layout: 'pdf'
	    end
		end
	end

	private

	def search_for_child_detail
		@child_detail = ChildDetail.find(params[:child_detail_id])
		@family = @child_detail.qualification.family
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
		if params[:client]
	  	@family ||= Family.find(params[:client][:family_id])
	  else
	  	@family ||= Family.find(params[:family_id])
	  end
	end

	def associate_age(client_params)
		birth_date_format = get_birth_date(client_params)
		@client.age = @client.get_age(birth_date_format)
	end

	def client_params
	  params.require(:client).permit(
	  	:age_category, :gender, :address_1, :address_2, :zip_code, :passport_expiration_date, :first_name, :last_name, :birth_date, :age, :email, :phone_number, :passport_number, :country_of_issue, :nationality, :first_language_level, :second_language_level, :first_language, :second_language, :preferred_hobbies, :smoker, :medical_issue, :comment, :family_id
	  )
	end
end