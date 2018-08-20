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
Qualification.destroy_all
Family.destroy_all

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

