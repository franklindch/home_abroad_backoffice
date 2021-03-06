class Family < ApplicationRecord
	include PgSearch
	belongs_to :qualification, optional: true
  has_many :clients, dependent: :destroy, inverse_of: :family

  # Attention : ligne commentée mais à remettre quand ce sera bon !
	# has_many :child_details, through: :qualifications, dependent: :destroy

	pg_search_scope :search_by_name,
					against: [:name],
					using: {
						tsearch: { prefix: true, negation: true}
					}

	enum family_situation: { Mariés: 1, Divorcés: 2, En_couple: 3, Veuf: 4, Vie_maritale: 5, Célibataire: 6, Ne_sait_pas: 7 }

  paginates_per 10000

	def self.retrieve_family(family_associated, family)
		family_associated ? Family.find(family_associated) : Family.find(family)
	end
end
