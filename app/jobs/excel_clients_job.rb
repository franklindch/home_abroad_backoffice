class ExcelClientsJob < ApplicationJob
  queue_as :default

  def perform(ressource)
    @excel = Excel.new(ressource)
    if ressource == 'families'
      return Family.all
    elsif ressource == 'clients'
      return Client.all
    elsif ressource == 'voyages_groupes'
      return TravelGroup.all
    elsif ressource == 'partenaires'
      return PartnerCompany.all
    elsif ressource == 'accompagnateurs'
      return Attendant.all
    elsif ressource == 'prospects'
      return ChildDetail.real_prospects
    end
  end
end
