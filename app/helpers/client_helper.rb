# frozen_string_literal: true

module ClientHelper
	def show_client_attribute(attribute, label)
		if attribute != ''
			"<p>#{label}: #{attribute}</p>".html_safe
		else 
			return ''
		end
	end
end