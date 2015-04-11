# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sex.create([{name: 'Femenino'}, {name: 'Masculino'}])

MaritalStatus.create([{name: 'Soltero(a)'}, {name: 'Casado(a)'}, {name: 'Unido(a)'}, {name: 'Divorciado(a)'}])

ProfessionalArea.create([{name: 'Administración'}, {name: 'Contabilidad'}, {name: 'Finanzas'}, {name: 'Mercadeo'}, {name: 'Atención al Cliente'}, {name: 'Ventas'}, {name: 'Comercio Exterior'}, {name: 'Comunicación y Relaciones Públicas'}, {name: 'Alta Gerencia'}, {name: 'Banca'}, {name: 'Derecho'}, {name: 'Logística'}, {name: 'Aduana'}, {name: 'Ingeniería Civil'}, {name: 'Mecánica Automotriz'}, {name: 'Publicidad'}, {name: 'Diseño'}, {name: 'Construcción'}, {name: 'Transporte Masivo'}, {name: 'Educación y Docencia'}, {name: 'Recursos Humanos y Capacitación'}, {name: 'Gastronomía'}, {name: 'Consumo Masivo'}, {name: 'Arquitectura'}, {name: 'Administración Pública'}, {name: 'Seguros'}, {name: 'Producción y Manufactura'}, {name: 'Importación'}, {name: 'Aeronáutica'}, {name: 'Marítima'}, {name: 'Salud, Medicina y Farmacia'}, {name: 'Turismo'}, {name: 'Ecología Ambiental'}, {name: 'Minería'}, {name: 'Tecnologías y Sistemas'}, {name: 'Telecomunicaciones'}, {name: 'Periodismo y Comunicación Social'}, {name: 'Secretariado'}, {name: 'Seguridad'}, {name: 'Aseo y Ornato'}, {name: 'Oficios'}])

EducationLevel.create([{ name: 'Primario '}, { name: 'Secundario' }, { name: 'Bachiller' }, {name: 'Técnico'}, { name: 'Universitario' }, { name: 'Postgrado '}, { name: 'Master' }, { name: 'Doctorado' }])
