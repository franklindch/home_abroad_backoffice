class PartnerCompaniesController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_partner_company, only: [:edit, :update, :destroy, :show]

	def new
	  @partner_company = PartnerCompany.new
	end

	def create
		# raise
	  @partner_company = PartnerCompany.new(partner_company_params)
	  if @partner_company.save
	    redirect_to partner_companies_path
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
	  @partner_companies = PartnerCompany.none
	  respond_to do |format|
	    format.html
	    format.js
	  end

	  if params[:query].present?
	    @partner_companies = PartnerCompany.search_by_name(params[:query]).page(params[:query])
	  else
	    @partner_companies = PartnerCompany.none
	  end
	end

	private

	def retrieve_partner_company
	  @partner_company ||= PartnerCompany.find(params[:id])
	end

	def partner_company_params
	  params.require(:partner_company).permit(
	    :country, :code, :address, :urgence_intl_phone_number, :nature, :name, :email, :phone_number, :zip_code, :intl_number, :urgence_phone_number
	  )
	end
end
