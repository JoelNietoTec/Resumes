# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sex.create([{name: 'Femenino'}, {name: 'Masculino'}])

MaritalStatus.create([{name: 'Soltero(a)'}, {name: 'Casado(a)'}, {name: 'Unido(a)'}, {name: 'Divorciado(a)'}])
