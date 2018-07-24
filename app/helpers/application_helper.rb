# frozen_string_literal: true

module ApplicationHelper
	def create_a_model(model)
		if model == "famille"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model}</i>").html_safe, new_family_path, class: 'btn btn-primary'
		elsif model == "client"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model}</i>").html_safe, new_client_path, class: 'btn btn-primary'
		elsif model == "voyage"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model}</i>").html_safe, new_travel_path, class: 'btn btn-primary'
		elsif model == "partenaire"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model}</i>").html_safe, new_partner_company_path, class: 'btn btn-primary'
		else
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model}</i>").html_safe, new_attendant_path, class: 'btn btn-primary'
		end
	end
end