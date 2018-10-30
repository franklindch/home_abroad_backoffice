class ExcelsController < ApplicationController
	before_action :authenticate_user!
	before_action :respond_format

	def all_families
		@families = Family.all
	end

  def all_partner_companies
    @partner_companies = PartnerCompany.all
  end

	def all_clients
		@clients = Client.all
	end

  def all_programs
    @programs = Program.all
  end

  def all_travel_groups
    @travel_groups = TravelGroup.all
  end

  def all_group_leaders
    @attendants = Attendant.all
  end

  def all_prospects
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
