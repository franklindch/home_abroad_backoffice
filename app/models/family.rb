class Family < ApplicationRecord
	include PgSearch
	belongs_to :qualification, optional: true
	has_many :clients, dependent: :destroy, inverse_of: :family

	pg_search_scope :search_by_name,
					against: [:name, :phone, :address_1],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}

	enum family_situation: { Mariés: 1, Divorcés: 2, En_couple: 3, Veuf: 4, Vie_maritale: 5, Célibataire: 6, Ne_sait_pas: 7 }

	validates :name, :email, :phone, presence: true
	validates :phone, uniqueness: true

	def self.retrieve_family(family_associated, family)
		if family_associated
			Family.find(family_associated)
		else
			Family.find(family)
		end
	end

	# def prospect?
	# 	prospect == true
	# end
end
