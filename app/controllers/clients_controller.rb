class ClientsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_client, only: [:edit, :update, :destroy, :show]
	def new
	  @client = Client.new
	end

	def create
	  @client = Client.new(client_params)
	  if @client.save
	    redirect_to clients_path
	  else
	    render :new
	  end
	end

	def edit
	end

	def update
	  @client.update(client_params)
	  redirect_to clients_path
	end

	def delete
	  @client.destroy
	  redirect_to clients_path
	end

	def index
		respond_to do |format|
			format.html
	    format.js
	  end

	  if params[:query].present?
	    @clients = Client.search_by_name(params[:query])
	  else
	    @clients = Client.order(:name).page params[:page]
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

	def retrieve_client
	  @client = Client.find(params[:id])
	end

	def client_params
	  params.require(:client).permit(
	  	:age_category, :gender, :first_name, :last_name, :birth_date, :age, :email, :phone_number, :passport_number, :country_of_issue, :nationality, :language_level, :preferred_hobbies, :smoker?, :medical_issue, :comment
	  )    
	end
end
