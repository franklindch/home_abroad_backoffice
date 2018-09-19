class Client < ApplicationRecord
  include PgSearch
  belongs_to :family
  has_many :language_stays, dependent: :destroy
  has_many :travels, through: :language_stays, dependent: :destroy
  # validates_uniqueness_of :first_name, scope: :family_id

  pg_search_scope :search_by_full_name,
  				against: [:first_name, :last_name],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum gender: { Male: 0, Female: 1 }
  enum school_grade: { Prépa: 0, Césure: 1, Terminale: 2, Première: 3, Seconde: 4, Troisième: 5, Quatrième: 6, Cinquième: 7, Sixième: 8 }
  enum age_category: { Junior: 0, Etudiant: 1, Adulte: 2 }
  enum first_language: { English: 0, Spanish: 1, German: 2 }
  enum first_language_level: { Beginner: 0, Intermediate: 1, Fluent: 2, Bilingual: 3, Ne_sait_pas: 4 }
  enum second_language: { English: 0, Spanish: 1, German: 2 }, _suffix: true
  enum second_language_level: { Beginner: 0, Intermediate: 1, Fluent: 2, Bilingual: 3, Ne_sait_pas: 4 }, _suffix: true


  enum season: { Saison_2018_2019: 0, Saison_2019_2020: 1 }
  # after_save :check_if_family_is_client
  # validates :age_category, :first_name, presence: true

  # before_save :capitalize_fields

  # def check_if_family_is_client
  #   if self.family.prospect?
  #     qualification = self.family.qualification
  #     qualification.check
  #   end
  # end
end
