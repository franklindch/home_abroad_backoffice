class Client < ApplicationRecord
  include PgSearch
  belongs_to :family, optional: true
  has_many :language_stays, dependent: :destroy
  has_many :travels, through: :language_stays, dependent: :destroy

  pg_search_scope :search_by_full_name,
  				against: [:first_name, :last_name],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum gender: { Male: 0, Female: 1 }
  enum school_grade: {
    CP: 0,
    CE1: 1,
    CE2: 2,
    CM1: 3,
    CM2: 4,
    Sixième: 5,
    Cinquième: 6,
    Quatrième: 7,
    Troisième: 8,
    Seconde: 9,
    Première: 10,
    Terminale: 11,
    Prépa: 12,
    Césure: 13,
    Etudes_supérieures: 14,
    Professionnel: 15
  }
  enum age_category: { Junior: 0, Adulte: 1 }
  enum first_language: { English: 0, Spanish: 1, German: 2 }
  enum first_language_level: { Beginner: 0, Intermediate: 1, Fluent: 2, Bilingual: 3, NA: 4 }
  enum second_language: { English: 0, Spanish: 1, German: 2 }, _suffix: true
  enum second_language_level: { Beginner: 0, Intermediate: 1, Fluent: 2, Bilingual: 3, NA: 4 }, _suffix: true


  # after_destroy :delete_from_family

  # def delete_from_family
  #   # raise
  #   raise
  #   family.clients.delete(self)
  #   # && family.qualification.child_details.find_by(first_name: self.first_name).update_columns(status: 'Prospect')
  # end

  enum season: { Saison_2018_2019: 0, Saison_2019_2020: 1 }
  validates :first_name, presence: true
  # after_save :check_if_family_is_client

  # before_save :capitalize_fields

  # def check_if_family_is_client
  #   if self.family.prospect?
  #     qualification = self.family.qualification
  #     qualification.check
  #   end
  # end
end
