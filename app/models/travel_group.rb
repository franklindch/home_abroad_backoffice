class TravelGroup < ApplicationRecord
	include PgSearch
  # belongs_to :attendants, through: :attendants_travel
  has_many :travel_details, dependent: :destroy, inverse_of: :travel_group
  has_many :correspondences, through: :travel_details, dependent: :destroy
  # has_many :travels, dependent: :destroy, if: :travel_group_present

  has_many :travels, dependent: :destroy, inverse_of: :travel_group
  belongs_to :language_stay, optional: true
  has_and_belongs_to_many :attendants
  # belongs_to :travel, class_name: 'Travel', foreign_key: "travel_group_id", optional: true
  # has_one :travel_group, class_name: 'Travel', foreign_key: "travel_group_id", dependent: :destroy
  # belongs_to :travel, class_name: 'Travel', optional: true
  # has_many :travels, class_name: 'Travel', dependent: :destroy
  # validates :travel_group_id, if: :travel_group_id_params

  accepts_nested_attributes_for :travel_details, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :correspondences, reject_if: :all_blank, allow_destroy: true

  pg_search_scope :search_by_travel_code,
  				against: [:travel_code],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum season: { Saison_2018_2019: 0, Saison_2019_2020: 1 }


  def travel_group_present
    travels != []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def travel_group_id_params
    params[:travel][:travel_group_id]
  end

  # def verify_uniqueness_pre_acheminement!
  #   throw(:abort) if (language_stay.travels.where(acheminement: 'Pré_acheminement').length > 0)
  # end

  # def verify_uniqueness_post_acheminement!
  #   throw(:abort) if (language_stay.travels.where(acheminement: 'Post_acheminement').length > 0)
  # end

  # def verify_uniqueness_travel_group_id!
  #   throw(:abort) if travel_group
  # end
end
