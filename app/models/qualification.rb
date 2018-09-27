class Qualification < ApplicationRecord
	has_many :child_details, dependent: :destroy, inverse_of: :qualification
	has_one :family, dependent: :destroy, inverse_of: :qualification
	# validates_uniqueness_of :family_id
	accepts_nested_attributes_for :child_details, reject_if: :all_blank, allow_destroy: true

	enum refered_by: { Ami: 1, Salon: 2, Rencontre_Home_Abroad: 3, Recherche_google: 4, Office: 5 }
	enum status: { Prospect: 1, Cliente: 2, Dormante: 3 }

	# validates :refered_by, :contact_mode, :data_entry_responsible, presence: true
	# enum commercial_responsible: HOME_ABROAD_EMPLOYEES

	def check
		update_columns(status: 'Cliente') if self.child_details { |child_detail| child_detail.client = true }
	end

	def status_to_close
		update_columns(status: 'Prospect_clôturé')
	end
end
