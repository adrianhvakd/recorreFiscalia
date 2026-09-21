import '../models/office.dart';

// Contenido conservado del prototipo. La pregunta 6 se añadió a partir de su descripción.
const offices = <Office>[
  Office(
    id: 1,
    floor: 1,
    name: 'INGRESO Y ORIENTACIÓN AL PÚBLICO',
    shortName: 'Ingreso',
    description:
        'Bienvenido a la Fiscalía Departamental de Potosí.\n\nEsta unidad brinda orientación y atención inicial a la ciudadanía.',
    question:
        '¿Cuál es una de las funciones principales de la Plataforma de Atención al Público?',
    options: [
      'A) Brindar orientación e información a la ciudadanía',
      'B) Realizar pericias médico-forenses',
      'C) Analizar muestras genéticas',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 2,
    floor: 1,
    name: 'PLATAFORMA DE ATENCIÓN AL PÚBLICO',
    shortName: 'Atención al público',
    description:
        'Esta unidad brinda atención a la ciudadanía.\n\nEn esta oficina se realiza la recepción de denuncias, recepción de memoriales y atención al público.',
    question:
        '¿Qué servicios se realizan en la Plataforma de Atención al Público?\n\n',
    options: [
      'A) Recepción de denuncias, memoriales y atención al público',
      'B) Realizar pericias médico-forenses',
      'C) Investigar delitos y dirigir procesos penales',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 3,
    floor: 1,
    name: 'IDIF – MEDICINA FORENSE',
    shortName: 'Medicina forense',
    description:
        'Esta unidad realiza evaluaciones y pericias médico-forenses para apoyar la investigación de hechos relacionados con la justicia.',
    question: '¿Cuál es una de las funciones principales de Medicina Forense?',
    options: [
      'A) Realizar evaluaciones médico-forenses',
      'B) Administrar los recursos económicos',
      'C) Registrar documentos administrativos',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 4,
    floor: 1,
    name: 'RCE - CADENA DE CUSTODIA',
    shortName: 'Cadena de custodia',
    description:
        'Esta unidad interviene en la recepción, registro y control de evidencias, garantizando su adecuada cadena de custodia.',
    question: '¿Qué se busca garantizar mediante la cadena de custodia?',
    options: [
      'A) La integridad y trazabilidad de las evidencias',
      'B) La eliminación de las evidencias',
      'C) La sustitución de las evidencias',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 5,
    floor: 1,
    name: 'TANATOLOGÍA',
    shortName: 'Tanatología',
    description:
        'Esta unidad interviene en el estudio médico-legal de las personas fallecidas.',
    question: '¿Cuál es una función principal de Tanatología Forense?',
    options: [
      'A) Brindar orientación al público',
      'B) Realizar estudios médico-legales relacionados con personas fallecidas',
      'C) Registrar y distribuir expedientes administrativos',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 6,
    floor: 2,
    name: 'LABORATORIO Y GENÉTICA',
    shortName: 'Laboratorio y genética',
    description:
        'Esta unidad realiza estudios y análisis de laboratorio relacionados con la investigación forense.',
    question: '¿Qué estudios realiza Laboratorio y Genética?',
    options: [
      'A) Estudios y análisis de laboratorio relacionados con la investigación forense.',
      'B) Gestión administrativa de las necesidades institucionales.',
      'C) Organización de actividades y eventos institucionales.',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 7,
    floor: 2,
    name: 'CÁMARA GESELL',
    shortName: 'Cámara Gesell',
    description:
        'Es un espacio especializado destinado a la realización de entrevistas y declaraciones bajo condiciones que buscan proteger a víctimas o testigos y evitar su revictimización.',
    question:
        '¿Cuál es una de las principales finalidades de la Cámara Gesell?',
    options: [
      'A) Realizar análisis de muestras genéticas.',
      'B) Administrar documentación administrativa.',
      'C) Facilitar la entrevista especializada a víctimas o testigos, especialmente en situaciones que requieren protección.',
    ],
    correctIndex: 2,
  ),
  Office(
    id: 8,
    floor: 2,
    name: 'TRABAJO SOCIAL',
    shortName: 'Trabajo social',
    description:
        'Esta unidad brinda apoyo social especializado dentro del ámbito forense, recopilando y valorando información del entorno familiar y social que puede contribuir a la atención de casos.',
    question:
        '¿Cuál es una de las funciones de Trabajo Social en el ámbito forense?',
    options: [
      'A) Recopilar y valorar información del entorno social y familiar para apoyar la atención de los casos.',
      'B) Realizar análisis genéticos de muestras biológicas.',
      'C) Administrar los recursos económicos de la institución.',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 9,
    floor: 2,
    name: 'PSICOLOGÍA FORENSE',
    shortName: 'Psicología forense',
    description:
        'Esta unidad realiza evaluaciones psicológicas forenses que aportan elementos especializados para la valoración de personas dentro de los procesos de investigación.',
    question:
        '¿Cuál es una de las principales funciones de Psicología Forense?',
    options: [
      'A) Administrar los recursos económicos de la institución.',
      'B) Realizar evaluaciones psicológicas forenses que aportan elementos especializados a la investigación.',
      'C) Recibir denuncias y memoriales de la ciudadanía.',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 10,
    floor: 2,
    name: 'JUSTICIA PENAL JUVENIL',
    shortName: 'Justicia penal juvenil',
    description:
        'Esta unidad interviene en casos relacionados con adolescentes en conflicto con la ley penal, considerando las características y principios propios de la justicia penal juvenil.',
    question:
        '¿A qué tipo de casos está relacionada principalmente la Justicia Penal Juvenil?',
    options: [
      'A) Casos exclusivamente relacionados con delitos económicos.',
      'B) Casos relacionados únicamente con análisis de laboratorio.',
      'C) Casos relacionados con adolescentes en conflicto con la ley penal.',
    ],
    correctIndex: 2,
  ),
  Office(
    id: 11,
    floor: 2,
    name: 'TRATA Y TRÁFICO DE PERSONAS',
    shortName: 'Trata y tráfico',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con la trata y tráfico de personas, contribuyendo a la protección de las víctimas y al esclarecimiento de estos delitos.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente esta unidad?',
    options: [
      'A) Con hechos relacionados con la trata y tráfico de personas.',
      'B) Con la realización de análisis genéticos de muestras biológicas.',
      'C) Con la administración de recursos económicos.',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 12,
    floor: 2,
    name: 'DELITOS SEXUALES',
    shortName: 'Delitos sexuales',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos sexuales, contribuyendo al esclarecimiento de los casos y a la protección de las víctimas.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente esta unidad?',
    options: [
      'A) Con la administración de recursos económicos.',
      'B) Con hechos relacionados con delitos sexuales.',
      'C) Con la realización de análisis de laboratorio y genética.',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 13,
    floor: 2,
    name: 'GÉNERO',
    shortName: 'Género',
    description:
        'Esta unidad interviene en la atención e investigación de hechos relacionados con violencia y delitos vinculados a género, contribuyendo a una respuesta especializada dentro del Ministerio Público.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente la Unidad de Género?',
    options: [
      'A) Con la administración de recursos económicos.',
      'B) Con la realización de análisis de laboratorio y genética.',
      'C) Con hechos relacionados con violencia y delitos vinculados a género.',
    ],
    correctIndex: 2,
  ),
  Office(
    id: 14,
    floor: 3,
    name: 'DESPACHO FISCAL DEPARTAMENTAL',
    shortName: 'Despacho fiscal',
    description:
        'Es la instancia que ejerce la dirección y representación del Ministerio Público en el departamento, coordinando y supervisando las actividades fiscales dentro de su jurisdicción.',
    question:
        '¿Cuál es una de las funciones del Despacho Fiscal Departamental?',
    options: [
      'A) Dirigir y coordinar las actividades del Ministerio Público en el departamento.',
      'B) Realizar únicamente análisis de muestras biológicas.',
      'C) Recibir exclusivamente denuncias y memoriales.',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 15,
    floor: 3,
    name: 'PSICOLOGÍA UPAVT',
    shortName: 'Psicología UPAVT',
    description:
        'La Unidad de Protección a Víctimas y Testigos brinda atención psicológica especializada a personas que requieren apoyo y protección dentro de procesos relacionados con la investigación de hechos.',
    question: '¿Cuál es una de las funciones de Psicología UPAVT?',
    options: [
      'A) Realizar análisis de laboratorio y genética.',
      'B) Brindar atención psicológica especializada a víctimas y testigos.',
      'C) Administrar los recursos económicos de la institución.',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 16,
    floor: 3,
    name: 'ANTICORRUPCIÓN',
    shortName: 'Anticorrupción',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos de corrupción, contribuyendo al esclarecimiento de los casos y a la defensa de los intereses del Estado.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente la Unidad Anticorrupción?',
    options: [
      'A) Con la realización de análisis genéticos.',
      'B) Con la atención de denuncias y memoriales en plataforma.',
      'C) Con la investigación de hechos relacionados con delitos de corrupción.',
    ],
    correctIndex: 2,
  ),
  Office(
    id: 17,
    floor: 3,
    name: 'UNIDAD DE ANÁLISIS',
    shortName: 'Análisis',
    description:
        'La Unidad de Análisis evalúa las denuncias, querellas o informes policiales que ingresan, con el propósito de determinar si un caso debe ser admitido, observado o desestimado antes de iniciar una investigación formal.',
    question: '¿Cuál es la principal función de la Unidad de Análisis?',
    options: [
      'A) Evaluar denuncias, querellas o informes policiales para determinar si corresponde admitir, observar o desestimar un caso.',
      'B) Realizar exclusivamente análisis de muestras biológicas.',
      'C) Administrar los recursos económicos de la institución.',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 18,
    floor: 3,
    name: 'UNIDAD DE INFORMÁTICA',
    shortName: 'Informática',
    description:
        'La Unidad de Informática brinda soporte tecnológico a las diferentes unidades de la Fiscalía Departamental de Potosí. Atiende requerimientos relacionados con equipos informáticos, sistemas, redes, conectividad y servicios tecnológicos.',
    question:
        '¿Cuál es una de las principales funciones de la Unidad de Informática?',
    options: [
      'A) Realizar exclusivamente evaluaciones médico-forenses.',
      'B) Brindar soporte tecnológico en equipos, sistemas, redes y servicios informáticos.',
      'C) Realizar únicamente entrevistas psicológicas.',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 19,
    floor: 4,
    name: 'SUSTANCIAS CONTROLADAS',
    shortName: 'Sustancias controladas',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con sustancias controladas, realizando las actuaciones fiscales correspondientes dentro del marco de la normativa vigente.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente la Unidad de Sustancias Controladas?',
    options: [
      'A) Con la realización de evaluaciones psicológicas.',
      'B) Con la recepción de memoriales y atención al público.',
      'C) Con la investigación de hechos relacionados con sustancias controladas.',
    ],
    correctIndex: 2,
  ),
  Office(
    id: 20,
    floor: 4,
    name: 'DELITOS PATRIMONIALES Y ECONÓMICOS',
    shortName: 'Patrimoniales y económicos',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos que afectan el patrimonio y los intereses económicos de las personas.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente esta unidad?',
    options: [
      'A) Con hechos que afectan el patrimonio y los intereses económicos.',
      'B) Con la realización de evaluaciones psicológicas forenses.',
      'C) Con la atención de víctimas y testigos mediante Cámara Gesell.',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 21,
    floor: 4,
    name: 'FISCALES CONCILIADORES',
    shortName: 'Conciliadores',
    description:
        'Los Fiscales Conciliadores intervienen en los casos en los que corresponde promover mecanismos de conciliación, buscando facilitar acuerdos entre las partes cuando la normativa permite esta alternativa.',
    question: '¿Cuál es una de las finalidades de la conciliación?',
    options: [
      'A) Realizar análisis de laboratorio y genética.',
      'B) Facilitar acuerdos entre las partes cuando la normativa permite la conciliación.',
      'C) Administrar los recursos económicos de la institución.',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 22,
    floor: 4,
    name: 'SOLUCIÓN TEMPRANA Y URI',
    shortName: 'Solución temprana y URI',
    description:
        'Esta unidad atiende casos que pueden ser gestionados mediante mecanismos de solución temprana, así como aquellos que requieren una atención inmediata y oportuna.',
    question: '¿Cuál es una característica de la Solución Temprana y URI?',
    options: [
      'A) Se dedica exclusivamente a realizar análisis genéticos.',
      'B) Se encarga únicamente de administrar recursos económicos.',
      'C) Permite atender determinados casos mediante mecanismos de solución temprana y atención oportuna.',
    ],
    correctIndex: 2,
  ),
  Office(
    id: 23,
    floor: 4,
    name: 'DELITOS CONTRA LA INTEGRIDAD',
    shortName: 'Contra la integridad',
    description:
        'Esta unidad interviene en la investigación de hechos que afectan la integridad de las personas, realizando las actuaciones fiscales correspondientes para el esclarecimiento de los casos.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente esta unidad?',
    options: [
      'A) Con hechos que afectan la integridad de las personas.',
      'B) Con el análisis de muestras genéticas.',
      'C) Con la administración de recursos económicos.',
    ],
    correctIndex: 0,
  ),
  Office(
    id: 24,
    floor: 4,
    name: 'DELITOS CONTRA LA VIDA',
    shortName: 'Contra la vida',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos que afectan la vida de las personas, realizando las actuaciones fiscales necesarias para el esclarecimiento de los casos.',
    question:
        '¿Con qué tipo de hechos se relaciona principalmente esta unidad?',
    options: [
      'A) Con la recepción de denuncias y memoriales.',
      'B) Con la realización de análisis de laboratorio y genética.',
      'C) Con la investigación de hechos relacionados con delitos que afectan la vida de las personas.',
    ],
    correctIndex: 2,
  ),
  Office(
    id: 25,
    floor: 4,
    name: 'FISCALES LITIGANTES',
    shortName: 'Fiscales litigantes',
    description:
        'Los Fiscales Litigantes participan en las actuaciones procesales y audiencias, sosteniendo la acusación fiscal y defendiendo los intereses de la sociedad durante las diferentes etapas del proceso penal.',
    question:
        '¿Cuál es una de las principales funciones de los Fiscales Litigantes?',
    options: [
      'A) Realizar exclusivamente análisis de laboratorio.',
      'B) Participar en actuaciones procesales y audiencias, sosteniendo la acusación fiscal.',
      'C) Administrar los recursos económicos de la institución.',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 26,
    floor: 5,
    name: 'UNIDAD DE ADMINISTRACIÓN',
    shortName: 'Administración',
    description:
        'La Unidad de Administración brinda apoyo en la gestión administrativa de la Fiscalía Departamental de Potosí, contribuyendo al funcionamiento y atención de las necesidades institucionales.',
    question: '¿Cuál es una de las funciones de la Unidad de Administración?',
    options: [
      'A) Realizar exclusivamente pericias médico-forenses.',
      'B) Brindar apoyo en la gestión administrativa y en las necesidades institucionales.',
      'C) Realizar únicamente entrevistas psicológicas a víctimas.',
    ],
    correctIndex: 1,
  ),
  Office(
    id: 27,
    floor: 5,
    name: 'AUDITORIO',
    shortName: 'Auditorio',
    description:
        'El Auditorio es un espacio destinado a actividades institucionales, capacitaciones, reuniones, actos y otros eventos de la Fiscalía Departamental de Potosí.',
    question:
        '¿Para qué actividades puede utilizarse principalmente el Auditorio?',
    options: [
      'A) Para realizar exclusivamente análisis de laboratorio.',
      'B) Para la recepción de denuncias y memoriales.',
      'C) Para actividades institucionales, capacitaciones, reuniones y otros eventos.',
    ],
    correctIndex: 2,
  ),
];
