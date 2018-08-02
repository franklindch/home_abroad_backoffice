class Qualification < ApplicationRecord
	has_many :child_details, dependent: :destroy, inverse_of: :qualification
	has_one :family, dependent: :destroy, inverse_of: :qualification
	accepts_nested_attributes_for :child_details, reject_if: :all_blank, allow_destroy: true

	enum refered_by: { Ami: 1, Salon: 2, Rencontre_Home_Abroad: 3, Recherche_google: 4 }
	enum data_entry_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6, Stagiaire: 7 }
	enum contact_mode: { Appel_entrant: 1, Webcontact: 2, Par_Office: 3, Email_en_direct: 4, Visite: 5 }
	enum status: { Prospect: 1, Cliente: 2, Dormante: 3 }
	# enum commercial_responsible: HOME_ABROAD_EMPLOYEES 
end
