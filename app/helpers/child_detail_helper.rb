# frozen_string_literal: true

module ChildDetailHelper
	def show_attribute(attribute, label)
		if attribute != ''
			"<h7>#{label}</h6><p class='card-text'>#{attribute&.humanize}</p>".html_safe
		else 
			return ''
		end
	end
end