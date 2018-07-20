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
Family.destroy_all

puts 'Creating qualifications...'
qualifications_attributes = [
  {
    comment:      'Besoin d\'informations sur les séjours Australie',
    status:       'Prospect'
  },
  {
    comment:      'Besoin d\'informations sur les tarifs Home Abroad. Pas très clair sur le site visiblement.',
    status:       'Prospect'
  },
  {
    comment:      'Veut qu\'on l\'aide pour sa fille bérénice',
    status:       'Client'
  }
]

Qualification.create!(qualifications_attributes)

puts 'Creating families...'
families_attributes = [
  {
    name:                     'Bernard',
    family_situation:         'engaged',
    address_1:                '12 rue de Rivoli',
    address_2:                '',
    zip_code:                 '75001',
    phone:                    '0132244628',
    fax:                      '',
    city:                     'Paris'
  },
  {
    name:                     'Dupuis',
    family_situation:         'engaged',
    address_1:                '191 rue Saint-Honoré',
    address_2:                '',
    zip_code:                 '75001',
    phone:                    '0115224698',
    fax:                      '',
    city:                     'Paris'
  },
  {
    name:                     'Lefranc',
    family_situation:         'celib',
    address_1:                '34 rue oudinot',
    address_2:                '',
    zip_code:                 '75007',
    phone:                    '017839203°',
    fax:                      '',
    city:                     'Paris'
  }
]

15.times do
  Family.create!(families_attributes)
end
puts 'Finished!'

