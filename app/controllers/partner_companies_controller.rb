class PartnerCompaniesController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_partner_company, only: [:edit, :update, :destroy, :show]

	def new
	  @partner_company = PartnerCompany.new
	end

	def create
	  @partner_company = PartnerCompany.new(partner_company_params)
	  if @partner_company.save
	    # partner_companyMailer.with(partner_company: @partner_company).welcome_email.deliver_now
	    redirect_to partner_company_path(@partner_company)
	  else
	    render :new
	  end
	end

	def edit; end

	def update
	  @partner_company.update(partner_company_params)
	  redirect_to partner_companies_path
	end

	def destroy
	  @partner_company.destroy
	  redirect_to partner_companies_path
	end

	def index
	  @partner_companies = PartnerCompany.order(:name).page(params[:page])
	  respond_to do |format|
	    format.html
	    format.js
	  end
	  
	  if params[:query].present?
	    @partner_companies = PartnerCompany.search_by_name(params[:query]).page(params[:query])
	  else
	    @partner_companies = PartnerCompany.order(:name).page params[:page]
	  end
	end

	def show
	end


	private

	def retrieve_partner_company
	  @partner_company ||= PartnerCompany.find(params[:id])
	end

	def partner_company_params
	  params.require(:partner_company).permit(
	    :type, :name, :email, :phone_number, :city, :zip_code, :country
	  )    
	end
end
