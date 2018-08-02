class PotentialLanguageStay < ApplicationRecord
	has_many :child_details, through: :child_detail_language_stays
end
