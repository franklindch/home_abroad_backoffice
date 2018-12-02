class ExcelsController < ApplicationController
  respond_to :xlsx, :html
	before_action :authenticate_user!

	def index
    @excel = Excel.new(ressource)
    # raise
    respond_to do |format|
      format.html
      format.xlsx { render xlsx: :index, filename: "#{params[:ressource]}"}
    end
	end

  private

  def ressource
    case params[:ressource]
    when 'families' then @ressource = Family.all
    when 'clients' then @ressource = Client.all
    when 'voyages_groupes' then @ressource = TravelGroup.all
    when 'partenaires' then @ressource = PartnerCompany.all
    when 'accompagnateurs' then @ressource = Attendant.all
    when 'prospects' then @ressource = ChildDetail.real_prospects
    end
  end
end
