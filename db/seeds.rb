# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# frank@frank.com / franklin

# puts 'Cleaning database...'
# Family.destroy_all
# Qualification.destroy_all
# Invoice.destroy_all
# LanguageStay.destroy_all
# Travel.destroy_all

# require 'csv'


# puts 'Importation des familles de l\'autre base...'
# csv_text = File.read(Rails.root.join('families.csv'))
# csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
# csv.each do |row|
#   Family.create!(
#     family_identifier: row['family_identifier'],
#     name: row['name'],
#     address_1: row['Address₁'],
#     zip_code: row['zip_code'],
#     city: row['city'],
#     intl_number: row['intl_number'],
#     email: row['email'],
#     father_name: row['father_name'],
#     mother_name: row['mother_name'],
#     father_email: row['father_email'],
#     mother_email: row['mother_email'],
#     mother_intl_number: row['mother_intl_number'],
#     father_intl_number: row['father_intl_number'],
#     mother_office_intl_number: row['mother_office_intl_number'],
#     father_office_intl_number: row['father_office_intl_number']
#   )
#   puts "Famille créée"
# end


# puts 'Importation des organismes/partenaires de l\'autre base...'
# csv_text = File.read(Rails.root.join('partner_companies.csv'))
# csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
# csv.each do |row|
#   PartnerCompany.create!(
#     name: row['name'],
#     email: row['email'],
#     country: row['country'],
#     address: row['address'],
#     nature: 'Organisme'
#   )
#   puts "Organisme créée"
# end

# puts 'Importation des clients de l\'autre base...'
# csv_text = File.read(Rails.root.join('clients.csv'))
# csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
# csv.each do |row, i|
#   client_i = Client.create!(
#     client_identifier: row['client_identifier'],
#     gender: row['gender'],
#     first_name: row['first_name'],
#     last_name: row['last_name'],
#     address_1: row['address_1'],
#     intl_number: row['intl_number'],
#     zip_code: row['zip_code'],
#     family_id: Family.where(family_identifier: row['family_identifier']).first&.id,
#     # last_name: "",
#     # birth_date: Wed, 21 Aug 1968,
#     # passport_expiration_date: Sat, 25 Dec 2021,
#     email: row['email'],
#     passport_number: row['passport_number'],
#     country_of_issue: row['country_of_issue']
#   )
#   puts "Client créée"
# end

require 'csv'


puts 'Importation des familles de l\'autre base...'
csv_text = File.read(Rails.root.join('accompagnateurs.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  Attendant.create!(
    email: row['email'],
    first_name: row['first_name'],
    last_name: row['last_name']
  )
  puts "Accompagnateur créé"
end



# state_of_progresses.each do |state_of_progress|
#   StateOfProgress.create!(name: state_of_progress)
# end


# puts ""
# puts "--------------------------------------------------------"
# puts "There are now #{Family.count} rows in the families table"
# puts "There are now #{Client.count} rows in the clients table"






# qualification_of_family_1: Qualification.create!(
# 	comment: "très sympathique au téléphone",
# 	status: "Prospect",
# 	refered_by: "Rencontre_Home_Abroad",
# 	data_entry_responsible: "Stagiaire",
# 	contact_mode: "Webcontact",
# 	reference_name: ""
# )

# qualification_of_family_2 = Qualification.create!(
# 	comment: "a l'air très sympa au premier contact - nouveau client",
# 	status: "Prospect",
# 	refered_by: "Ami",
# 	data_entry_responsible: "Christine",
# 	contact_mode: "Par_Office",
# 	reference_name: ""
# )


# family_1 = Family.create!(
# 	name: "JACQUES",
# 	family_situation: "Veuf",
# 	address_1: "12 Avenue Trudaine, Paris, France",
# 	address_2: "2ieme étage",
# 	zip_code: 75002,
# 	intl_phone: "012323233",
# 	qualification_id: qualification_of_family_1.id,
# 	email: "jacques@zddz.com",
# 	father_name: "pierre JACQUES",
# 	mother_name: "",
# 	mother_phone: "",
# 	father_phone: "0623283923",
# 	mother_email: "",
# 	father_email: "pierre@jacques.com"
#  )
