class Travel < ApplicationRecord
	include PgSearch
  # belongs_to :attendants, through: :attendants_travel
  has_many :travel_details, dependent: :destroy, inverse_of: :travel
  has_many :correspondences, through: :travel_details
  belongs_to :language_stay, optional: true
  belongs_to :attendant, optional: true
  belongs_to :travel, optional: true

  # validates :travel_group_id, if: :travel_group_id_params

  accepts_nested_attributes_for :travel_details, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :correspondences, reject_if: :all_blank, allow_destroy: true

  pg_search_scope :search_by_travel_code, 
  				against: [:travel_code],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum nature: { Groupe: 0, Groupe_décalé: 1, Pré_acheminement: 2, Post_acheminement: 3, Indépendant: 4, Individuel: 5 }
  # validate :coverimage_size

  private

  def travel_group_id_params
    params[:travel][:travel_group_id]
  end

   # private

   # # Validates the size of an uploaded picture.
   # def coverimage_size
   #   if coverimage.size > 5.megabytes
   #     errors.add(:coverimage, "should be less than 5MB")
   #   end
   # end
end
