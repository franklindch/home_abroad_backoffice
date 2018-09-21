class ExcelsController < ApplicationController
	before_action :authenticate_user!
	before_action :respond_format, except: [:static]

	def static; end

	def all_families
		@families = Family.all
	end

	def all_clients
		@clients = Client.all
	end

	def all_partners
    @partner_companies = PartnerCompany.all
  end

	private

	def respond_format
		respond_to do |format|
		  format.html
		  format.xlsx
		end
	end
end
