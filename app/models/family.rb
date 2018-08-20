class Family < ApplicationRecord
	include PgSearch
	belongs_to :qualification, dependent: :destroy, optional: true
	has_many :clients, dependent: :destroy, inverse_of: :family
	has_many :child_details, dependent: :destroy, through: :qualification
	pg_search_scope :search_by_name, 
					against: [:name, :phone, :address_1],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}

	enum family_situation: { Mariés: 1, Divorcés: 2, En_couple: 3, Veuf: 4, Vie_maritale: 5, Célibataire: 6 }
	# paginates_per 10

	# before_save :capitalize_fields

	validates :name, :email, :phone, presence: true
	validates :phone, uniqueness: true

	def self.retrieve_family(family_associated)
		if family_associated
			Family.find(params[:client][:family_id])
		else
			Family.find(params[:family_id])
		end
	end
end