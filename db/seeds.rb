Sex.create([{name: 'Femenino'}, {name: 'Masculino'}])

MaritalStatus.create([{name: 'Soltero(a)'}, {name: 'Casado(a)'}, {name: 'Unido(a)'}, {name: 'Divorciado(a)'}])

ProfessionalArea.create([{name: 'Administración'}, {name: 'Contabilidad'}, {name: 'Finanzas'}, {name: 'Mercadeo'}, {name: 'Atención al Cliente'}, {name: 'Ventas'}, {name: 'Comercio Exterior'}, {name: 'Comunicación y Relaciones Públicas'}, {name: 'Alta Gerencia'}, {name: 'Banca'}, {name: 'Derecho'}, {name: 'Logística'}, {name: 'Aduana'}, {name: 'Ingeniería Civil'}, {name: 'Mecánica Automotriz'}, {name: 'Publicidad'}, {name: 'Diseño'}, {name: 'Construcción'}, {name: 'Transporte Masivo'}, {name: 'Educación y Docencia'}, {name: 'Recursos Humanos y Capacitación'}, {name: 'Gastronomía'}, {name: 'Consumo Masivo'}, {name: 'Arquitectura'}, {name: 'Administración Pública'}, {name: 'Seguros'}, {name: 'Producción y Manufactura'}, {name: 'Importación'}, {name: 'Aeronáutica'}, {name: 'Marítima'}, {name: 'Salud, Medicina y Farmacia'}, {name: 'Turismo'}, {name: 'Ecología Ambiental'}, {name: 'Minería'}, {name: 'Tecnologías y Sistemas'}, {name: 'Telecomunicaciones'}, {name: 'Periodismo y Comunicación Social'}, {name: 'Secretariado'}, {name: 'Seguridad'}, {name: 'Aseo y Ornato'}, {name: 'Oficios'}])

EducationLevel.create([{ name: 'Primario '}, { name: 'Secundario' }, { name: 'Bachiller' }, {name: 'Técnico'}, { name: 'Universitario' }, { name: 'Postgrado '}, { name: 'Master' }, { name: 'Doctorado' }])

JobType.create ([{ name: 'Tiempo Completo' }, { name: 'Tiempo Parcial' }, { name: 'Por Contrato' }, { name: 'Temporal' }, { name: 'Pasantía' }, { name: 'Fin de Semana' }, { name: 'Freelance' }, { name: 'Por Horas' }])

PostulationStatus.create([{ name: 'Enviada' }, { name: 'Revisada' }, { name: 'Pre-Seleccionada' }, { name: 'Seleccionada' }])

Role.create([{ name: 'admin', description: 'Administrador' }, { name: 'candidate', description: 'Candidato' }, { name: 'company', description: 'Empresa' }])


CompanyType.create([
  { name: 'Microempresa', description: 'Poseen hasta 10 trabajadores' },
  { name: 'Pequeña Empresa', description: 'Poseen entre 11 y 49 trabajadores' },
  { name: 'Mediana Empresa', description: 'Poseen entre 50 y 250 trabajadores' },
  { name: 'Gran Empresa', description: 'Tienen más de 250 trabajadores' }
  ])
