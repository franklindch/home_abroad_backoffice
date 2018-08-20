# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def capitalize_fields
  #   return self.first_name.capitalize! && self.last_name.upcase! if self.age_category
  #   self.name if self.family_situation
  # end
end
