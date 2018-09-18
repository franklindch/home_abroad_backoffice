# frozen_string_literal: true

module FamilyHelper
	def count_clients(family)
    if family.clients.count == 0
      "<span class='badge badge-info mt-3'>Encore aucun Client<span>".html_safe
    elsif family.clients.count == 1
      "<span class='badge badge-info mt-3'>#{family.clients.count} Client<span>".html_safe
    else
      "<span class='badge badge-info mt-3'>#{family.clients.count} Clients<span>".html_safe
	  end
  end
end
