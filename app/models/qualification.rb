class Qualification < ApplicationRecord
	has_many :child_details, dependent: :destroy, inverse_of: :qualification
	has_many :families, dependent: :destroy, inverse_of: :qualification
	accepts_nested_attributes_for :child_details, reject_if: :all_blank, allow_destroy: true
end
