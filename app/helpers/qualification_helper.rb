# frozen_string_literal: true

module QualificationHelper
	def show_attribute(attribute, label)
		if attribute != ''
			"<h6>#{label}</h6><p class='pb-2'>#{attribute&.humanize}</p>".html_safe
		else 
			return ''
		end
	end
end