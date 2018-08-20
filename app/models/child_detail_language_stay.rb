class ChildDetailLanguageStay < ApplicationRecord
  belongs_to :potential_language_stay
  belongs_to :child_detail
end
