# frozen_string_literal: true

module ApplicationHelper
	def create_a_model(model)
		if model == "famille"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer une #{model.capitalize}</i>").html_safe, new_family_path, class: 'btn btn-primary'
		elsif model == "client"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize}</i>").html_safe, new_client_path, class: 'btn btn-primary'
		elsif model == "voyage"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize} Groupe</i>").html_safe, new_travel_path(groupe: 'Groupe'), class: 'btn btn-primary'
		elsif model == "partenaire"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize}</i>").html_safe, new_partner_company_path, class: 'btn btn-primary'
		elsif model == "accompagnateur"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize}</i>").html_safe, new_attendant_path, class: 'btn btn-primary'
		else
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize}</i>").html_safe, new_program_path, class: 'btn btn-primary'
		end
	end

	def number_to_phone(number)
		new_number = []
		number.split('').each_slice(2).to_a.each do |slice|
			new_number << slice.join
		end
	  	return new_number.join(' ')
	end

	def data(model, column, h1)
		# unless model.column == ""
		# 	h6 = "#{h1}"
		# 	p.pb-2 = "#{qualification&.status}"
		# end
	end
end