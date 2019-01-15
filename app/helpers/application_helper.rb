# frozen_string_literal: true

module ApplicationHelper
	def create_a_model(model)
		if model == "famille"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer une #{model.capitalize}</i>").html_safe, new_family_path, class: 'btn btn-primary'
		elsif model == "voyage"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize} Groupe</i>").html_safe, new_travel_group_path, class: 'btn btn-primary'
		elsif model == "partenaire"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize}</i>").html_safe, new_partner_company_path, class: 'btn btn-primary'
		elsif model == "accompagnateur"
			link_to ("<i class=\"fa fas fa-plus-circle\">Créer un #{model.capitalize}</i>").html_safe, new_attendant_path, class: 'btn btn-primary'
		elsif model == "programme"
      link_to ("<i class=\"fa fas fa-plus-circle\">Créer un séjour</i>").html_safe, new_program_path, class: 'btn btn-primary'
    end
	end

  def search_message
    "Merci de lancer votre recherche"
  end

	def number_to_phone(number)
		number != nil ? "#{number[0..2]} #{number[3..-1]}" : nil
	end

  def show_attribute_nil(attribute, label)
    if attribute != nil
      "<p><u>#{label}</u> #{attribute}</p>".html_safe
    else
      return ''
    end
  end

  def show_attribute_null(attribute, label)
    if attribute != 0
      "<p><u>#{label}</u> #{attribute}</p>".html_safe
    else
      return ''
    end
  end

  def bold(string)
    "<b>#{string}</b>".html_safe
  end

  def show_attribute_empty_string(attribute, label)
    if attribute != ''
      "<p><u>#{label}</u> #{attribute}</p>".html_safe
    else
      return ''
    end
  end

  def show_attribute_empty_string_no_underline(attribute, label)
    if attribute != ''
      "<p>#{label} <b>#{attribute}</b></p>".html_safe
    else
      return ''
    end
  end

  def show_list_attribute(attribute, label)
    if attribute != ''
      "<h6>#{label}</h6><p class='pb-2'>#{attribute&.humanize}</p>".html_safe
    else
      return ''
    end
  end

	def show_the_age(date_of_birth)
  		now = Time.now.utc.to_date
  		now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
	end

	def birth_date_format(instance)
		instance.birth_date.strftime("%d/%m/%Y")
	end

	def date_format(value)
		value&.strftime("%d/%m/%Y")
	end
	def c(name)
		name&.upcase
	end

  def time_format(time)
    time.strftime('%H:%M')
  end

  def get_comercial_responsible_name(list)
    list.first {|commercial_responsible| commercial_responsible == current_user.first_name }
  end

  def week_day(date)
    wday = date.wday
    I18n.t('date.day_names')[wday].capitalize
  end
end
