# frozen_string_literal: true

module FamilyHelper
	def count_children(family)
		return family.qualification.child_details.count + family.clients.count
	end
end