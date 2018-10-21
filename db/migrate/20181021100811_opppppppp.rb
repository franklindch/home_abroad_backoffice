class Opppppppp < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :picture, :boolean, default: false
    add_column :language_stays, :family_file, :boolean, default: false
    add_column :language_stays, :school_notes, :boolean, default: false
    add_column :language_stays, :language_test, :boolean, default: false
    add_column :language_stays, :junior_waiver, :boolean, default: false
    add_column :language_stays, :parent_consent, :boolean, default: false
    add_column :language_stays, :medical_form, :boolean, default: false
    add_column :language_stays, :english_cv, :boolean, default: false
    add_column :language_stays, :motivation_letter, :boolean, default: false
    add_column :language_stays, :agreement_welcome_school, :boolean, default: false
    add_column :language_stays, :justice_record, :boolean, default: false
    add_column :language_stays, :rules_and_regulations, :boolean, default: false
    add_column :language_stays, :teacher_reference, :boolean, default: false
  end
end
