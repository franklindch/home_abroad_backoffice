class Qualification < ApplicationRecord
	has_many :child_details, dependent: :destroy, inverse_of: :qualification
	has_one :family, inverse_of: :qualification
	accepts_nested_attributes_for :child_details, reject_if: :all_blank, allow_destroy: true

	enum refered_by: { Ami: 1, Salon: 2, Rencontre_Home_Abroad: 3, Recherche_google: 4 }
	enum commercial_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6, Stagiaire: 7 }, _suffix: true
	enum data_entry_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6, Stagiaire: 7 }, _suffix: true
	enum contact_mode: { Appel_entrant: 1, Webcontact: 2, Office: 3, Email_en_direct: 4, Visite: 5 }, _suffix: true
	# enum commercial_responsible: HOME_ABROAD_EMPLOYEES 
end
