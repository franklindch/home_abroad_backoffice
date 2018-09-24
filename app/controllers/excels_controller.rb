class ExcelsController < ApplicationController
	before_action :authenticate_user!
	before_action :respond_format

	def all_families
		@families = Family.all
	end

	def all_clients
		@clients = Client.all
	end

	def all_partners
    @partner_companies = PartnerCompany.all
  end

  def all_programs
    @programs = Program.all
  end


  def all_attendants
    @attendants = Attendant.all
  end

  def all_child_details
    @child_details = ChildDetail.where(
      status: 'Prospect'
      ).or(ChildDetail.where(
        status: 'Prospect_clôturé')).order(:first_name
      ).page params[:page]
  end

	private

	def respond_format
		respond_to do |format|
		  format.html
		  format.xlsx
		end
	end
end
