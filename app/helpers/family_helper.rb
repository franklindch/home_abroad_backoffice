# frozen_string_literal: true

module FamilyHelper
	def count_clients(family)
    if family.clients.count == 0
      "Encore aucun Client".html_safe
    elsif family.clients.count == 1
      "#{family.clients.count} Client au total".html_safe
    else
      "#{family.clients.count} Clients au total".html_safe
	  end
  end
end
