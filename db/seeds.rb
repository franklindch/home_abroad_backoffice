# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# frank@frank.com / franklin

puts 'Cleaning database...'
Invoice.destroy_all
Qualification.destroy_all
LanguageStay.destroy_all
Travel.destroy_all
Family.destroy_all

qualification_of_family_1 = Qualification.create!(
	comment: "très sympathique au téléphone",
	status: "Prospect",
	refered_by: "Rencontre_Home_Abroad",
	data_entry_responsible: "Stagiaire",
	contact_mode: "Webcontact",
	reference_name: ""
)

qualification_of_family_2 = Qualification.create!(
	comment: "a l'air très sympa au premier contact - nouveau client",
	status: "Prospect",
	refered_by: "Ami",
	data_entry_responsible: "Christine",
	contact_mode: "Par_Office",
	reference_name: ""
)


family_1 = Family.create!(
	name: "JACQUES",
	family_situation: "Veuf",
	address_1: "12 Avenue Trudaine, Paris, France",
	address_2: "2ieme étage",
	zip_code: 75002,
	intl_phone: "012323233",
	qualification_id: qualification_of_family_1.id,
	email: "jacques@zddz.com",
	father_name: "pierre JACQUES",
	mother_name: "",
	mother_phone: "",
	father_phone: "0623283923",
	mother_email: "",
	father_email: "pierre@jacques.com"
 )

family_2 = Family.create!(
	name: "JAMES",
	family_situation: "Divorcés",
	address_1: "191 Rue Saint-Honoré, Paris, France",
	address_2: "2ième étage, porte à gauche",
	zip_code: 75001,
	phone: "132238293",
	qualification_id: ualification_of_family_2.id,
	email: "james@family.com",
	father_name: "François JAMES",
	mother_name: "Marie FRANC",
	mother_phone: "629302381",
	father_phone: "623232392",
	mother_email: "marie.franc@gmail.com",
	father_email: "francois.james@email.fr",
	mother_intl_number: "+33629302381",
	father_intl_number: "+33623232392",
	intl_number: "+33132238293"
)

child_detail_of_family_1 = ChildDetail.create!(
	first_name: "isaure",
	last_name: "JACQUES",
	age: 17,
	comment: "timide",
	qualification_id: qualification_of_family_1.id,
	email: "",
	gender: "Masculin",
	school_grade: "Terminale",
	school: "saint-jean hulst",
	duration: 2,
	month: "Décembre",
	client: false
)


child_detail_of_family_2 = ChildDetail.create!(
	first_name: "jean-baptiste",
	last_name: "JAMES",
	age: 14,
	comment: "intéressé par summer camp principalement",
	qualification_id: qualification_of_family_2.id,
	email: "jb.james@gmail.com",
	gender: "Masculin",
	school_grade: "Quatrième",
	school: "saint-jean",
	duration: 4,
	month: "Août",
	client: nil
)

client_of_family_1 = Client.create!(
	age_category: "Junior",
	gender: nil,
	first_name: "isaure",
	last_name: "",
	birth_date: Wed, 21 Aug 1968,
	age: 17,
	email: nil,
	phone_number: nil,
	passport_number: "12BC3242432",
	country_of_issue: "FR",
	nationality: "French",
	first_language_level: "Courant",
	preferred_hobbies: "footing, lecture",
	medical_issue: "aucun",
	smoker: false,
	comment: "",
	family_id: family_1.id,
	address_1: "",
	address_2: "",
	zip_code: nil,
	passport_expiration_date: Sat, 25 Dec 2021,
	second_language_level: "Intermédiaire",
	first_language: "Anglais",
	second_language: "Espagnol"
)

program_1 = Program.create!(
	name: 'Séjours en famille'
)

partner_company_1 = PartnerCompany.create!(
	name: 'ELS'
)

language_stay_for_client_of_family_1 = LanguageStay.create!(
	data_entry_responsible: 0,
	commercial_responsible: 0,
	duration: 0,
	activities: "",
	fee: true,
	program_id: program_1.id,
	client_id: client_of_family_1.id,
	partner_company_id: partner_company_1.id ,
	phone_during_stay: "062738232",
	start_date: Mon, 08 Apr 2019,
	end_date: Sat, 27 Apr 2019,
	location: "massachusets",
	transfer: "",
	pension: "non",
	accomodation: "non",
	option_1: "",
	option_2: "",
	class_hours: 12,
	precisions: ""
)

attendant_1 = Attendant.create!(
	first_name: "Jeremy",
	last_name: "Oliviera",
	age: 25,
	email: "oliviera.jeremy@gmail.com",
	phone: "0627382902"
)




# Attendant.destroy_all
# Camp.destroy_all
# Client.destroy_all
# Correspondence.destroy_all
# Employee.destroy_all
# PartnerCompany.destroy_all
# Program.destroy_all
# TravelDetail.destroy_all
# Travel.destroy_all

# puts 'Creating attendants...'
# attendants_attributes = [
#   {
#     first_name:      'Jacques',
#     last_name:       'Jeanpierre',
#     age:       '30',
#     email:       'jacques.jeanpierre@gmail.com',
#     phone:       '0668695116'
#   },
#   {
#     first_name:      'Jean',
#     last_name:       'Lefrançais',
#     age:       '22',
#     email:       'jean.lefrançais@hotmail.com',
#     phone:       '0668475116'
#   },
#   {
#     first_name:      'Anne',
#     last_name:       'Marie',
#     age:       '23',
#     email:       'anne.marie@gmail.com',
#     phone:       '0668202116'
#   }
# ]
# Attendant.create!(attendants_attributes)

# puts 'Creating qualifications...'
# qualifications_attributes = [
#   {
#     comment:      'Besoin d\'informations sur les séjours Australie',
#     status:       'Prospect',
#     refered_by:       'Prospect',
#     data_entry_responsible:       'Prospect',
#     commercial_responsible:       'Prospect'
#   },
#   {
#     comment:      'Besoin d\'informations sur les tarifs Home Abroad. Pas très clair sur le site visiblement.',
#     status:       'Prospect'
#   },
#   {
#     comment:      'Veut qu\'on l\'aide pour sa fille bérénice',
#     status:       'Client'
#   }
# ]
# Qualification.create!(qualifications_attributes)

# puts 'Creating child_details...'
# child_details_attributes = [
#   {
#     first_name:      'François',
#     last_name:       'Michel',
#     age:       '15',
#     comment:       'Est assez timide et réservé visiblement',
#     qualification:       Qualification.first,
#     email:       'francois_michel@hotmail.fr',
#     gender:       '0611695116',
#     school_grade:       'Troisième',
#     school:       'Saint-jean-hulst'
#   },
#   {
#     first_name:      'Anne',
#     last_name:       'Olivier',
#     age:       '19',
#     comment:       'N\'aime pas du tout les gens',
#     qualification:       Qualification.second,
#     email:       'francois_michel@hotmail.fr',
#     gender:       '0628695516',
#     school_grade:       'Prépa',
#     school:       'Saint-jean-hulst'
#   },
#   {
#     first_name:      'François',
#     last_name:       'Michel',
#     age:       '15',
#     comment:       'Est assez timide et réservé visiblement',
#     qualification:       Qualification.first,
#     email:       'francois_michel@hotmail.fr',
#     gender:       '0668695116',
#     school_grade:       'Troisième',
#     school:       'Saint-jean-hulst'
#   }
# ]
# ChildDetail.create!(child_details_attributes)








# puts 'Creating families...'
# families_attributes = [
#   {
#     name:                     'Bernard',
#     family_situation:         'engaged',
#     address_1:                '12 rue de Rivoli',
#     address_2:                '',
#     zip_code:                 '75001',
#     phone:                    '0132244628',
#     fax:                      '',
#     city:                     'Paris'
#   },
#   {
#     name:                     'Dupuis',
#     family_situation:         'engaged',
#     address_1:                '191 rue Saint-Honoré',
#     address_2:                '',
#     zip_code:                 '75001',
#     phone:                    '0115224698',
#     fax:                      '',
#     city:                     'Paris'
#   },
#   {
#     name:                     'Lefranc',
#     family_situation:         'celib',
#     address_1:                '34 rue oudinot',
#     address_2:                '',
#     zip_code:                 '75007',
#     phone:                    '017839203°',
#     fax:                      '',
#     city:                     'Paris'
#   }
# ]

# 15.times do
#   Family.create!(families_attributes)
# end
# puts 'Finished!'

