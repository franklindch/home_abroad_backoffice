class Client < ApplicationRecord
  include PgSearch
  belongs_to :family
  has_many :language_stays, dependent: :destroy
  has_many :travels, through: :language_stays
  validates_uniqueness_of :first_name, scope: :family_id

  pg_search_scope :search_by_full_name, 
  				against: [:first_name, :last_name],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum gender: { Masculin: 0, Féminin: 1 }
  enum age_category: { Junior: 0, Etudiant: 1, Adulte: 2 }
  enum first_language: { Anglais: 0, Espagnol: 1, Allemand: 2 }
  enum first_language_level: { Débutant: 0, Intermédiaire: 1, Courant: 2, Bilingue: 3 }
  enum second_language: { Anglais: 0, Espagnol: 1, Allemand: 2 }, _suffix: true
  enum second_language_level: { Débutant: 0, Intermédiaire: 1, Courant: 2, Bilingue: 3 }, _suffix: true

  # validates :age_category, :first_name, presence: true
  # before_save :uniqu_first_name_and_family

  # def uniqu_first_name_and_family
  #   ChildDetail.where(first_name: params[:child_detail][:first_name], last_name: params[:child_detail][:last_name]).size == 0
  # end

  # before_save :capitalize_fields


  def associate_age(client_params)
    get_birth_date(client_params)
  end

  def get_birth_date(client_params)
    {
      day: client_params["birth_date(3i)"].to_i,
      month: client_params["birth_date(2i)"].to_i,
      year: client_params["birth_date(1i)"].to_i
    }
  end
  
  def get_age(birth_date_format)
    now = Time.now.utc.to_date
    now.year - birth_date_format[:year] - ((now.month > birth_date_format[:month] || (now.month == birth_date_format[:month] && now.day >= birth_date_format[:day])) ? 0 : 1)
  end


  # def get_age(dob)
  #   now = Time.now.utc.to_date
  #   now.year - dob[:year] - ((now.month > dob[:month] || (now.month == dob[:month] && now.day >= dob[:day])) ? 0 : 1)
  # end
end
