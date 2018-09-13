# frozen_string_literal: true

module ApplicationHelper
	def create_a_model(model)
		if model == "famille"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer une #{model.capitalize}</i>").html_safe, new_family_path(prospect: false), class: 'btn btn-primary'
		elsif model == "client"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize}</i>").html_safe, new_client_path, class: 'btn btn-primary'
		elsif model == "voyage"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize} Groupe</i>").html_safe, new_travel_group_path, class: 'btn btn-primary'
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
		number.split('').each_slice(3).to_a.each do |slice|
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

	def show_the_age(date_of_birth)
  		now = Time.now.utc.to_date
  		now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
	end

	def birth_date_format(instance)
		instance.birth_date.strftime("%d/%m/%Y")
	end

	def date_format(value)
		value.strftime("%d/%m/%Y")
	end
	def c(name)
		name&.upcase
	end
end
