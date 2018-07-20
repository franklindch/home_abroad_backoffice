class ClientsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_client, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_family, only: [:edit, :update, :destroy, :create]

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
	  @client.save
	  @family.qualification.update_columns(status: STATUSES[2])
	  redirect_to family_client_path(@family, @client)
	end

	def edit
	end

	def update
	  @client.update(client_params)
	  redirect_to clients_path
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
	    @clients = Client.search_by_last_name(params[:query]).page params[:page]
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
		child_detail = ChildDetail.find(params[:child_detail_id])
	  @client = Client.new(first_name: child_detail.first_name, last_name: child_detail.last_name, age: child_detail.age)
	  respond_to do |format|
	    format.html # new.html.erb
	    format.xml  { render xml: @client }
	  end
	end

	def retrieve_client
	  @client ||= Client.find(params[:id])
	end

	def retrieve_family
	  @family ||= Family.find(params[:client][:family_id])
	end

	def client_params
	  params.require(:client).permit(
	  	:age_category, :gender, :first_name, :last_name, :birth_date, :age, :email, :phone_number, :passport_number, :country_of_issue, :nationality, :language_level, :preferred_hobbies, :smoker?, :medical_issue, :comment, :family_id
	  )    
	end
end
