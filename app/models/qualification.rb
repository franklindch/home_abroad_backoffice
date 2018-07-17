class Qualification < ApplicationRecord
	balongs_to :child_detail
	has_many :families
end
