import '../models/office.dart';

// Preguntas de BANCO DE 135 PREGUNTAS.md, agrupadas por oficina.
const offices = <Office>[
  Office(
    id: 1,
    floor: 1,
    name: 'INGRESO Y ORIENTACIÓN AL PÚBLICO',
    shortName: 'Ingreso',
    description:
        'Bienvenido a la Fiscalía Departamental de Potosí.\n\nEsta unidad brinda orientación y atención inicial a la ciudadanía.',
    questions: [
      OfficeQuestion(
        question: '¿Cuál es una función fundamental del Ministerio Público?',
        options: [
          'A) Dirigir la investigación de los delitos y promover la acción penal pública.',
          'B) Dictar sentencias penales.',
          'C) Ejecutar directamente las penas.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio debe respetarse durante la actuación del Ministerio Público?',
        options: [
          'A) Arbitrariedad.',
          'B) Legalidad.',
          'C) Privilegio personal.',
        ],
        correctIndex: 1,
      ),
      OfficeQuestion(
        question:
            '¿Quién dirige la investigación de los delitos de acción pública?',
        options: [
          'A) El Ministerio Público.',
          'B) El acusado.',
          'C) El testigo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué debe existir para imponer una condena penal?',
        options: [
          'A) Una denuncia verbal solamente.',
          'B) Una sentencia ejecutoriada después del debido proceso.',
          'C) Una decisión administrativa.',
        ],
        correctIndex: 1,
      ),
      OfficeQuestion(
        question: '¿Cuál es uno de los fines del Ministerio Público?',
        options: [
          'A) Defender la legalidad y los intereses generales de la sociedad.',
          'B) Resolver conflictos civiles como juez.',
          'C) Dictar leyes nacionales.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 2,
    floor: 1,
    name: 'PLATAFORMA DE ATENCIÓN AL PÚBLICO',
    shortName: 'Atención al público',
    description:
        'Esta unidad brinda atención a la ciudadanía.\n\nEn esta oficina se realiza la recepción de denuncias, recepción de memoriales y atención al público.',
    questions: [
      OfficeQuestion(
        question:
            '¿Qué puede poner en conocimiento de la autoridad una persona que conoce la comisión de un delito?',
        options: ['A) Una denuncia.', 'B) Una sentencia.', 'C) Una condena.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué finalidad tiene una denuncia penal?',
        options: [
          'A) Poner en conocimiento de la autoridad la posible comisión de un delito.',
          'B) Dictar directamente una sentencia.',
          'C) Imponer una pena.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué autoridad dirige la investigación de los delitos de acción pública?',
        options: [
          'A) El Ministerio Público.',
          'B) El notario.',
          'C) El juez civil.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: 'La etapa preparatoria tiene como finalidad:',
        options: [
          'A) Preparar el juicio oral mediante la recolección de elementos que permitan sustentar la acusación o la defensa.',
          'B) Ejecutar directamente la sentencia.',
          'C) Elaborar leyes.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio impide utilizar contra el imputado pruebas obtenidas ilegalmente?',
        options: [
          'A) Principio de legalidad de la prueba.',
          'B) Principio de publicidad comercial.',
          'C) Principio de oportunidad administrativa.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 3,
    floor: 1,
    name: 'IDIF – MEDICINA FORENSE',
    shortName: 'Medicina forense',
    description:
        'Esta unidad realiza evaluaciones y pericias médico-forenses para apoyar la investigación de hechos relacionados con la justicia.',
    questions: [
      OfficeQuestion(
        question:
            '¿Para qué puede ser importante una valoración médico-forense dentro de una investigación penal?',
        options: [
          'A) Para aportar elementos científicos relacionados con hechos investigados.',
          'B) Para dictar sentencia.',
          'C) Para determinar el presupuesto institucional.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'En una investigación por lesiones, una valoración médico-forense puede ayudar a determinar:',
        options: [
          'A) Características y consecuencias de las lesiones.',
          'B) El salario del investigador.',
          'C) La ubicación del juzgado.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué característica debe tener una prueba obtenida durante una investigación penal?',
        options: [
          'A) Debe respetar la Constitución y las leyes.',
          'B) Puede obtenerse de cualquier manera.',
          'C) No necesita relación con el hecho investigado.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Quién dirige la investigación penal?',
        options: [
          'A) El Ministerio Público.',
          'B) El médico forense.',
          'C) El secretario administrativo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'Una pericia médico-forense puede servir principalmente para:',
        options: [
          'A) Aportar conocimientos especializados al esclarecimiento de un hecho.',
          'B) Reemplazar al juez.',
          'C) Sustituir la sentencia.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 4,
    floor: 1,
    name: 'RCE - CADENA DE CUSTODIA',
    shortName: 'Cadena de custodia',
    description:
        'Esta unidad interviene en la recepción, registro y control de evidencias, garantizando su adecuada cadena de custodia.',
    questions: [
      OfficeQuestion(
        question:
            '¿Qué finalidad tiene preservar correctamente un elemento relacionado con una investigación?',
        options: [
          'A) Mantener su integridad y asegurar su adecuada utilización como elemento de prueba.',
          'B) Modificarlo para hacerlo más útil.',
          'C) Destruirlo después de registrarlo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Por qué es importante la cadena de custodia?',
        options: [
          'A) Para garantizar la identificación, conservación y trazabilidad del elemento.',
          'B) Para determinar la pena automáticamente.',
          'C) Para reemplazar la investigación fiscal.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede el fiscal utilizar pruebas obtenidas vulnerando la Constitución y las leyes?',
        options: ['A) Sí, siempre.', 'B) No.', 'C) Solo si son fotografías.'],
        correctIndex: 1,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe evitarse durante la conservación de un elemento de prueba?',
        options: [
          'A) Su contaminación, alteración o pérdida.',
          'B) Su identificación.',
          'C) Su registro.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: 'La cadena de custodia está relacionada principalmente con:',
        options: [
          'A) La preservación y trazabilidad de los elementos recolectados.',
          'B) El nombramiento de fiscales.',
          'C) La administración de salarios.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 5,
    floor: 1,
    name: 'TANATOLOGÍA',
    shortName: 'Tanatología',
    description:
        'Esta unidad interviene en el estudio médico-legal de las personas fallecidas.',
    questions: [
      OfficeQuestion(
        question:
            '¿Qué puede aportar la tanatología forense a una investigación?',
        options: [
          'A) Información científica relacionada con la muerte.',
          'B) La sentencia definitiva.',
          'C) La acusación fiscal.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'Ante una muerte posiblemente delictiva, ¿qué corresponde realizar?',
        options: [
          'A) Investigar las circunstancias del hecho.',
          'B) Archivar automáticamente el caso.',
          'C) Imponer una pena inmediatamente.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué puede determinar una autopsia médico-legal?',
        options: [
          'A) Elementos relacionados con la causa y circunstancias de la muerte.',
          'B) La culpabilidad definitiva de una persona.',
          'C) La sentencia judicial.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Quién dirige la investigación de un posible delito?',
        options: [
          'A) El Ministerio Público.',
          'B) El médico forense exclusivamente.',
          'C) El personal administrativo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una pericia por sí sola reemplazar la decisión judicial sobre culpabilidad?',
        options: ['A) Sí.', 'B) No.', 'C) Siempre que sea una pericia médica.'],
        correctIndex: 1,
      ),
    ],
  ),
  Office(
    id: 6,
    floor: 2,
    name: 'LABORATORIO Y GENÉTICA',
    shortName: 'Laboratorio y genética',
    description:
        'Esta unidad realiza estudios y análisis de laboratorio relacionados con la investigación forense.',
    questions: [
      OfficeQuestion(
        question:
            '¿Para qué puede utilizarse una prueba genética en una investigación penal?',
        options: [
          'A) Para aportar información científica relacionada con una persona o elemento biológico investigado.',
          'B) Para dictar sentencia automáticamente.',
          'C) Para elegir al fiscal.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe respetar una prueba científica obtenida durante una investigación?',
        options: [
          'A) Las garantías y normas legales aplicables.',
          'B) Únicamente la opinión del investigador.',
          'C) Ninguna formalidad.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: 'Una muestra biológica puede ser considerada:',
        options: [
          'A) Un elemento que puede contribuir a la investigación.',
          'B) Una sentencia.',
          'C) Una medida cautelar.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Quién dirige la investigación penal?',
        options: [
          'A) El Ministerio Público.',
          'B) El laboratorio.',
          'C) El testigo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: 'Una pericia genética debe ser valorada:',
        options: [
          'A) Dentro del conjunto de elementos obtenidos legalmente en la investigación.',
          'B) Como sentencia automática.',
          'C) Como sustituto del juez.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 7,
    floor: 2,
    name: 'CÁMARA GESELL',
    shortName: 'Cámara Gesell',
    description:
        'Es un espacio especializado destinado a la realización de entrevistas y declaraciones bajo condiciones que buscan proteger a víctimas o testigos y evitar su revictimización.',
    questions: [
      OfficeQuestion(
        question:
            '¿Cuál es una finalidad de utilizar mecanismos especiales de entrevista a víctimas o testigos?',
        options: [
          'A) Evitar la revictimización y obtener información de manera adecuada.',
          'B) Sustituir al juez.',
          'C) Eliminar la investigación.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La declaración de una persona puede constituir un elemento dentro de una investigación?',
        options: ['A) Sí.', 'B) No.', 'C) Solo si la persona es fiscal.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe protegerse durante una actuación investigativa con una víctima?',
        options: [
          'A) Sus derechos y garantías.',
          'B) Solamente los intereses del investigador.',
          'C) Únicamente el expediente.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe evitar el sistema de justicia respecto de una víctima vulnerable?',
        options: [
          'A) La revictimización innecesaria.',
          'B) La protección.',
          'C) La asistencia.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Quién dirige la investigación de un delito de acción pública?',
        options: [
          'A) El Ministerio Público.',
          'B) El entrevistador.',
          'C) El testigo.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 8,
    floor: 2,
    name: 'TRABAJO SOCIAL',
    shortName: 'Trabajo social',
    description:
        'Esta unidad brinda apoyo social especializado dentro del ámbito forense, recopilando y valorando información del entorno familiar y social que puede contribuir a la atención de casos.',
    questions: [
      OfficeQuestion(
        question:
            '¿Cuál es una finalidad de la atención a víctimas dentro del Ministerio Público?',
        options: [
          'A) Facilitar asistencia y protección dentro de sus competencias.',
          'B) Determinar la sentencia.',
          'C) Imponer una pena.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿El contexto social de una víctima puede ser relevante para una investigación?',
        options: [
          'A) Sí, cuando resulte pertinente para comprender el caso.',
          'B) Nunca.',
          'C) Solo en procesos civiles.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Cuál debe ser una característica de la atención institucional?',
        options: [
          'A) Respeto a los derechos y garantías de las personas.',
          'B) Discriminación.',
          'C) Arbitrariedad.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿El Ministerio Público debe actuar bajo el principio de legalidad?',
        options: ['A) Sí.', 'B) No.', 'C) Solo en casos administrativos.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La atención a una víctima sustituye la investigación fiscal?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 9,
    floor: 2,
    name: 'PSICOLOGÍA FORENSE',
    shortName: 'Psicología forense',
    description:
        'Esta unidad realiza evaluaciones psicológicas forenses que aportan elementos especializados para la valoración de personas dentro de los procesos de investigación.',
    questions: [
      OfficeQuestion(
        question: '¿Para qué puede servir una evaluación psicológica forense?',
        options: [
          'A) Para aportar conocimientos especializados relevantes para una investigación.',
          'B) Para dictar sentencia.',
          'C) Para sustituir al fiscal.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una pericia psicológica determinar por sí sola la culpabilidad penal?',
        options: ['A) Sí.', 'B) No.', 'C) Siempre.'],
        correctIndex: 1,
      ),
      OfficeQuestion(
        question: '¿Qué debe respetarse durante la entrevista de una víctima?',
        options: [
          'A) Sus derechos y dignidad.',
          'B) Únicamente el interés del investigador.',
          'C) Ninguna garantía.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: 'La prueba pericial se caracteriza por utilizar:',
        options: [
          'A) Conocimientos especializados.',
          'B) Opiniones políticas.',
          'C) Decisiones administrativas.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Quién dirige la investigación penal?',
        options: [
          'A) El Ministerio Público.',
          'B) El psicólogo.',
          'C) El trabajador social.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 10,
    floor: 2,
    name: 'JUSTICIA PENAL JUVENIL',
    shortName: 'Justicia penal juvenil',
    description:
        'Esta unidad interviene en casos relacionados con adolescentes en conflicto con la ley penal, considerando las características y principios propios de la justicia penal juvenil.',
    questions: [
      OfficeQuestion(
        question:
            '¿Una persona puede ser condenada sin un juicio previo y legal?',
        options: ['A) Sí.', 'B) No.', 'C) Solo si existe denuncia.'],
        correctIndex: 1,
      ),
      OfficeQuestion(
        question: '¿Qué principio debe respetarse durante un proceso penal?',
        options: [
          'A) Debido proceso.',
          'B) Arbitrariedad.',
          'C) Condena automática.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Quién dirige la investigación de los delitos de acción pública?',
        options: [
          'A) Ministerio Público.',
          'B) Juez civil.',
          'C) Defensoría exclusivamente.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe garantizarse a una persona sometida a un proceso penal?',
        options: [
          'A) Sus derechos y garantías.',
          'B) Únicamente la acusación.',
          'C) Ningún derecho.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una autoridad imponer una condena sin sentencia judicial?',
        options: ['A) Sí.', 'B) No.', 'C) Solo verbalmente.'],
        correctIndex: 1,
      ),
    ],
  ),
  Office(
    id: 11,
    floor: 2,
    name: 'TRATA Y TRÁFICO DE PERSONAS',
    shortName: 'Trata y tráfico',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con la trata y tráfico de personas, contribuyendo a la protección de las víctimas y al esclarecimiento de estos delitos.',
    questions: [
      OfficeQuestion(
        question:
            'Ante conocimiento de un posible delito, ¿qué corresponde al Ministerio Público?',
        options: [
          'A) Dirigir la investigación conforme a la ley.',
          'B) Ignorar el hecho.',
          'C) Dictar directamente sentencia.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'En una investigación penal, ¿qué debe protegerse especialmente respecto de una víctima?',
        options: [
          'A) Sus derechos y dignidad.',
          'B) Solo la documentación administrativa.',
          'C) Ninguna garantía.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué principio debe orientar la actuación fiscal?',
        options: ['A) Legalidad.', 'B) Arbitrariedad.', 'C) Favoritismo.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué finalidad tiene la etapa preparatoria?',
        options: [
          'A) Recolectar elementos para sustentar la acusación o la defensa y preparar el juicio.',
          'B) Dictar sentencia.',
          'C) Ejecutar la pena.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede utilizarse prueba obtenida vulnerando derechos y garantías?',
        options: ['A) Sí.', 'B) No.', 'C) Siempre que sea importante.'],
        correctIndex: 1,
      ),
    ],
  ),
  Office(
    id: 12,
    floor: 2,
    name: 'DELITOS SEXUALES',
    shortName: 'Delitos sexuales',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos sexuales, contribuyendo al esclarecimiento de los casos y a la protección de las víctimas.',
    questions: [
      OfficeQuestion(
        question:
            'En una investigación de delitos sexuales, ¿qué debe garantizarse a la víctima?',
        options: [
          'A) Respeto de sus derechos y dignidad.',
          'B) La exposición pública innecesaria.',
          'C) La ausencia de protección.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe evitarse durante la investigación de un delito sexual?',
        options: [
          'A) La revictimización innecesaria.',
          'B) La protección de la víctima.',
          'C) La investigación científica.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Quién dirige la investigación penal?',
        options: [
          'A) El Ministerio Público.',
          'B) El médico exclusivamente.',
          'C) El testigo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué puede constituir un elemento de investigación?',
        options: [
          'A) Una declaración, una pericia u otro elemento obtenido legalmente.',
          'B) Únicamente una confesión.',
          'C) Solo una fotografía.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una pericia sustituir la decisión del juez sobre la culpabilidad?',
        options: ['A) Sí.', 'B) No.', 'C) Siempre.'],
        correctIndex: 1,
      ),
    ],
  ),
  Office(
    id: 13,
    floor: 2,
    name: 'GÉNERO',
    shortName: 'Género',
    description:
        'Esta unidad interviene en la atención e investigación de hechos relacionados con violencia y delitos vinculados a género, contribuyendo a una respuesta especializada dentro del Ministerio Público.',
    questions: [
      OfficeQuestion(
        question:
            '¿Debe el Ministerio Público respetar la dignidad y derechos de las personas durante sus actuaciones?',
        options: ['A) Sí.', 'B) No.', 'C) Solo en determinados casos.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué principio orienta la actuación del Ministerio Público?',
        options: ['A) Legalidad.', 'B) Discriminación.', 'C) Arbitrariedad.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'Ante una denuncia que contiene posibles hechos delictivos, ¿qué corresponde?',
        options: [
          'A) Darle el tratamiento correspondiente conforme a la ley y realizar las actuaciones de investigación pertinentes.',
          'B) Ignorarla.',
          'C) Dictar sentencia inmediatamente.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué debe evitarse durante la atención de víctimas?',
        options: [
          'A) La revictimización innecesaria.',
          'B) La protección.',
          'C) La asistencia.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿El Ministerio Público ejerce la acción penal pública?',
        options: ['A) Sí.', 'B) No.', 'C) Solo en procesos civiles.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 14,
    floor: 3,
    name: 'DESPACHO FISCAL DEPARTAMENTAL',
    shortName: 'Despacho fiscal',
    description:
        'Es la instancia que ejerce la dirección y representación del Ministerio Público en el departamento, coordinando y supervisando las actividades fiscales dentro de su jurisdicción.',
    questions: [
      OfficeQuestion(
        question: '¿Qué regula la Ley Orgánica del Ministerio Público?',
        options: [
          'A) La organización, atribuciones y funcionamiento del Ministerio Público.',
          'B) Únicamente los contratos privados.',
          'C) Solamente los procesos civiles.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Cuál es una finalidad del Ministerio Público?',
        options: [
          'A) Defender la legalidad y los intereses generales de la sociedad.',
          'B) Dictar sentencias judiciales.',
          'C) Aprobar leyes.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿El Ministerio Público tiene autonomía funcional, administrativa y financiera?',
        options: ['A) Sí.', 'B) No.', 'C) Solo autonomía deportiva.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio forma parte de la actuación del Ministerio Público?',
        options: [
          'A) Legalidad.',
          'B) Arbitrariedad.',
          'C) Privilegio personal.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Quién forma parte de la estructura jerárquica del Ministerio Público?',
        options: [
          'A) Fiscales Departamentales.',
          'B) Únicamente jueces.',
          'C) Únicamente policías.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 15,
    floor: 3,
    name: 'PSICOLOGÍA UPAVT',
    shortName: 'Psicología UPAVT',
    description:
        'La Unidad de Protección a Víctimas y Testigos brinda atención psicológica especializada a personas que requieren apoyo y protección dentro de procesos relacionados con la investigación de hechos.',
    questions: [
      OfficeQuestion(
        question: '¿Qué busca la protección de víctimas y testigos?',
        options: [
          'A) Brindar protección y asistencia conforme a la ley.',
          'B) Sustituir al juez.',
          'C) Dictar sentencia.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Debe protegerse la dignidad de la víctima durante una actuación fiscal?',
        options: ['A) Sí.', 'B) No.', 'C) Solo cuando lo solicite.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Puede una evaluación psicológica sustituir una sentencia?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe evitarse al entrevistar repetidamente a una víctima?',
        options: [
          'A) Revictimización innecesaria.',
          'B) Protección.',
          'C) Asistencia.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La protección de víctimas forma parte de las funciones institucionales relacionadas con el Ministerio Público?',
        options: ['A) Sí.', 'B) No.', 'C) Solo corresponde a particulares.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 16,
    floor: 3,
    name: 'ANTICORRUPCIÓN',
    shortName: 'Anticorrupción',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos de corrupción, contribuyendo al esclarecimiento de los casos y a la defensa de los intereses del Estado.',
    questions: [
      OfficeQuestion(
        question:
            '¿Qué debe hacer el Ministerio Público ante conocimiento de un delito de acción pública?',
        options: [
          'A) Promover y dirigir su investigación.',
          'B) Ignorarlo.',
          'C) Dictar sentencia.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio debe observar un fiscal durante una investigación?',
        options: ['A) Objetividad.', 'B) Favoritismo.', 'C) Arbitrariedad.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Puede el fiscal utilizar una prueba obtenida ilegalmente?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué busca la etapa preparatoria?',
        options: [
          'A) Preparar el juicio mediante la recolección de elementos relevantes.',
          'B) Dictar sentencia.',
          'C) Ejecutar la pena.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La lucha contra delitos de corrupción puede involucrar la acción penal pública?',
        options: ['A) Sí.', 'B) No.', 'C) Solo en procesos civiles.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 17,
    floor: 3,
    name: 'UNIDAD DE ANÁLISIS',
    shortName: 'Análisis',
    description:
        'La Unidad de Análisis evalúa las denuncias, querellas o informes policiales que ingresan, con el propósito de determinar si un caso debe ser admitido, observado o desestimado antes de iniciar una investigación formal.',
    questions: [
      OfficeQuestion(
        question:
            '¿Qué debe hacer el fiscal cuando tiene conocimiento de la comisión de un delito de acción pública?',
        options: [
          'A) Promover y dirigir la investigación.',
          'B) Dictar sentencia.',
          'C) Archivar automáticamente.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Cuál es la finalidad de la etapa preparatoria?',
        options: [
          'A) Preparar el juicio oral mediante la recolección de elementos.',
          'B) Ejecutar la condena.',
          'C) Dictar leyes.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio exige que el fiscal actúe considerando tanto elementos favorables como desfavorables al imputado?',
        options: [
          'A) Objetividad.',
          'B) Publicidad comercial.',
          'C) Jerarquía administrativa.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué dirige el Ministerio Público?',
        options: [
          'A) La investigación de los delitos de acción pública.',
          'B) Las elecciones nacionales.',
          'C) Los procesos administrativos privados.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La investigación debe realizarse respetando las garantías legales?',
        options: ['A) Sí.', 'B) No.', 'C) Solo cuando exista acusación.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 18,
    floor: 3,
    name: 'UNIDAD DE INFORMÁTICA',
    shortName: 'Informática',
    description:
        'La Unidad de Informática brinda soporte tecnológico a las diferentes unidades de la Fiscalía Departamental de Potosí. Atiende requerimientos relacionados con equipos informáticos, sistemas, redes, conectividad y servicios tecnológicos.',
    questions: [
      OfficeQuestion(
        question:
            'Una persona accede sin autorización a datos informáticos protegidos. ¿Qué área del Derecho Penal puede relacionarse con esta conducta?',
        options: [
          'A) Delitos informáticos.',
          'B) Derecho sucesorio.',
          'C) Derecho laboral.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe hacerse con una evidencia digital relacionada con un delito?',
        options: [
          'A) Preservarla adecuadamente para evitar su alteración o pérdida.',
          'B) Modificarla para facilitar la investigación.',
          'C) Eliminarla después de revisarla.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una evidencia digital ser relevante para una investigación penal?',
        options: ['A) Sí.', 'B) No.', 'C) Solo si está impresa.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio debe respetarse al obtener evidencia informática?',
        options: [
          'A) Legalidad.',
          'B) Arbitrariedad.',
          'C) Modificación libre.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'Si un investigador altera deliberadamente una evidencia digital, ¿qué problema puede generarse?',
        options: [
          'A) Puede afectar su integridad y valor dentro de la investigación.',
          'B) Mejora automáticamente su valor probatorio.',
          'C) Se convierte automáticamente en sentencia.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 19,
    floor: 4,
    name: 'SUSTANCIAS CONTROLADAS',
    shortName: 'Sustancias controladas',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con sustancias controladas, realizando las actuaciones fiscales correspondientes dentro del marco de la normativa vigente.',
    questions: [
      OfficeQuestion(
        question:
            'En una investigación por sustancias controladas, ¿quién dirige la investigación penal?',
        options: [
          'A) El Ministerio Público.',
          'B) El juez civil.',
          'C) El personal administrativo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe hacerse con una sustancia incautada relacionada con una investigación?',
        options: [
          'A) Preservarla y documentarla conforme a las reglas legales aplicables.',
          'B) Destruirla inmediatamente sin registro.',
          'C) Entregarla a cualquier persona.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Por qué es importante la cadena de custodia?',
        options: [
          'A) Para garantizar la integridad y trazabilidad del elemento.',
          'B) Para determinar automáticamente la culpabilidad.',
          'C) Para sustituir al juez.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede utilizarse una prueba obtenida ilegalmente contra el imputado?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué debe respetarse durante una investigación penal?',
        options: [
          'A) Las garantías y derechos establecidos por la ley.',
          'B) Únicamente la voluntad del investigador.',
          'C) Ninguna formalidad.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 20,
    floor: 4,
    name: 'DELITOS PATRIMONIALES Y ECONÓMICOS',
    shortName: 'Patrimoniales y económicos',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos que afectan el patrimonio y los intereses económicos de las personas.',
    questions: [
      OfficeQuestion(
        question: '¿Qué protege principalmente un delito contra el patrimonio?',
        options: [
          'A) Bienes e intereses patrimoniales protegidos por la ley penal.',
          'B) Solamente la vida.',
          'C) Únicamente la libertad de expresión.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe hacer el Ministerio Público ante conocimiento de un delito de acción pública?',
        options: [
          'A) Dirigir la investigación.',
          'B) Dictar sentencia.',
          'C) Ejecutar directamente una pena.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio debe respetarse durante la investigación de un delito patrimonial?',
        options: ['A) Objetividad.', 'B) Favoritismo.', 'C) Arbitrariedad.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una prueba obtenida ilegalmente utilizarse contra el imputado?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre que sea importante.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Cuál puede ser un elemento importante para investigar un delito patrimonial?',
        options: [
          'A) Documentos, registros u otros elementos obtenidos legalmente.',
          'B) Rumores sin ninguna verificación.',
          'C) Una sentencia previamente inexistente.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 21,
    floor: 4,
    name: 'FISCALES CONCILIADORES',
    shortName: 'Conciliadores',
    description:
        'Los Fiscales Conciliadores intervienen en los casos en los que corresponde promover mecanismos de conciliación, buscando facilitar acuerdos entre las partes cuando la normativa permite esta alternativa.',
    questions: [
      OfficeQuestion(
        question:
            '¿Qué busca una salida alternativa basada en la conciliación cuando legalmente corresponde?',
        options: [
          'A) Resolver el conflicto mediante un acuerdo permitido por la ley.',
          'B) Dictar automáticamente una condena.',
          'C) Eliminar todos los derechos de las partes.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede aplicarse una salida alternativa en cualquier delito sin considerar la ley?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué debe respetar una actuación de conciliación?',
        options: [
          'A) Los requisitos y límites establecidos por la ley.',
          'B) Únicamente la voluntad del fiscal.',
          'C) Ninguna formalidad.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: 'La conciliación busca principalmente:',
        options: [
          'A) Una solución al conflicto cuando legalmente es procedente.',
          'B) Imponer una pena.',
          'C) Reemplazar todos los procesos penales.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La conciliación significa que el fiscal puede ignorar la ley?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 22,
    floor: 4,
    name: 'SOLUCIÓN TEMPRANA Y URI',
    shortName: 'Solución temprana y URI',
    description:
        'Esta unidad atiende casos que pueden ser gestionados mediante mecanismos de solución temprana, así como aquellos que requieren una atención inmediata y oportuna.',
    questions: [
      OfficeQuestion(
        question: '¿Qué busca una solución temprana dentro del sistema penal?',
        options: [
          'A) Resolver determinadas situaciones conforme a las salidas previstas legalmente.',
          'B) Evitar siempre cualquier investigación.',
          'C) Sustituir al juez.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede aplicarse un criterio de oportunidad fuera de los casos permitidos por ley?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Quién dirige la investigación penal?',
        options: [
          'A) El Ministerio Público.',
          'B) El acusado.',
          'C) El personal administrativo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué debe respetar una salida alternativa?',
        options: [
          'A) Los requisitos establecidos por la legislación procesal.',
          'B) Solamente la decisión del investigador.',
          'C) Ninguna condición.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La aplicación de una salida alternativa significa que desaparecen los derechos de las partes?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 23,
    floor: 4,
    name: 'DELITOS CONTRA LA INTEGRIDAD',
    shortName: 'Contra la integridad',
    description:
        'Esta unidad interviene en la investigación de hechos que afectan la integridad de las personas, realizando las actuaciones fiscales correspondientes para el esclarecimiento de los casos.',
    questions: [
      OfficeQuestion(
        question:
            '¿Qué bien jurídico puede estar relacionado con los delitos de lesiones?',
        options: [
          'A) La integridad corporal o salud.',
          'B) Exclusivamente el patrimonio.',
          'C) Únicamente la propiedad intelectual.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'Ante una posible lesión delictiva, ¿qué puede aportar la medicina forense?',
        options: [
          'A) Elementos científicos sobre las lesiones.',
          'B) Una sentencia.',
          'C) Una acusación automática.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Quién dirige la investigación penal?',
        options: [
          'A) El Ministerio Público.',
          'B) El médico forense.',
          'C) El testigo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Puede una pericia médica sustituir la decisión judicial?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué debe respetarse durante la investigación de un delito de lesiones?',
        options: [
          'A) Los derechos y garantías de las personas involucradas.',
          'B) Solo la versión del investigador.',
          'C) Ninguna garantía.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 24,
    floor: 4,
    name: 'DELITOS CONTRA LA VIDA',
    shortName: 'Contra la vida',
    description:
        'Esta unidad interviene en la investigación de hechos relacionados con delitos que afectan la vida de las personas, realizando las actuaciones fiscales necesarias para el esclarecimiento de los casos.',
    questions: [
      OfficeQuestion(
        question:
            '¿Cuál es el bien jurídico protegido en los delitos contra la vida?',
        options: ['A) La vida.', 'B) El patrimonio.', 'C) La propiedad.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            'Ante una muerte posiblemente delictiva, ¿qué debe realizarse?',
        options: [
          'A) Una investigación de las circunstancias del hecho.',
          'B) Una condena inmediata.',
          'C) Un archivo automático.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué puede aportar una autopsia médico-legal?',
        options: [
          'A) Información científica relacionada con la muerte.',
          'B) Una sentencia.',
          'C) Una acusación definitiva.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una pericia determinar por sí sola la culpabilidad de una persona?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Quién dirige la investigación de un posible delito contra la vida?',
        options: [
          'A) El Ministerio Público.',
          'B) El médico forense exclusivamente.',
          'C) El personal administrativo.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 25,
    floor: 4,
    name: 'FISCALES LITIGANTES',
    shortName: 'Fiscales litigantes',
    description:
        'Los Fiscales Litigantes participan en las actuaciones procesales y audiencias, sosteniendo la acusación fiscal y defendiendo los intereses de la sociedad durante las diferentes etapas del proceso penal.',
    questions: [
      OfficeQuestion(
        question:
            '¿Cuál es una función del Ministerio Público durante el proceso penal?',
        options: [
          'A) Promover la acción penal pública y participar en el proceso.',
          'B) Dictar sentencia.',
          'C) Ejercer funciones legislativas.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué finalidad tiene el juicio oral?',
        options: [
          'A) Resolver judicialmente la responsabilidad penal conforme al debido proceso.',
          'B) Reemplazar la investigación.',
          'C) Crear nuevas leyes.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Puede el fiscal utilizar pruebas obtenidas ilegalmente?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Qué principio debe observar el fiscal?',
        options: ['A) Objetividad.', 'B) Favoritismo.', 'C) Arbitrariedad.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question: '¿Puede condenarse a una persona sin sentencia ejecutoriada?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre que exista denuncia.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 26,
    floor: 5,
    name: 'UNIDAD DE ADMINISTRACIÓN',
    shortName: 'Administración',
    description:
        'La Unidad de Administración brinda apoyo en la gestión administrativa de la Fiscalía Departamental de Potosí, contribuyendo al funcionamiento y atención de las necesidades institucionales.',
    questions: [
      OfficeQuestion(
        question:
            '¿La Ley 260 contempla la autonomía administrativa del Ministerio Público?',
        options: ['A) Sí.', 'B) No.', 'C) Solo autonomía deportiva.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué norma regula la organización y funcionamiento del Ministerio Público?',
        options: [
          'A) Ley N.º 260.',
          'B) Código de Comercio exclusivamente.',
          'C) Código Civil exclusivamente.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La administración institucional debe desarrollarse dentro del marco legal?',
        options: ['A) Sí.', 'B) No.', 'C) Solo cuando existe auditoría.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Cuál de estas corresponde a una característica institucional del Ministerio Público?',
        options: [
          'A) Autonomía administrativa.',
          'B) Dependencia absoluta de particulares.',
          'C) Ausencia de organización.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿La Ley 260 forma parte del marco normativo del Ministerio Público?',
        options: ['A) Sí.', 'B) No.', 'C) Solo para procesos civiles.'],
        correctIndex: 0,
      ),
    ],
  ),
  Office(
    id: 27,
    floor: 5,
    name: 'AUDITORIO',
    shortName: 'Auditorio',
    description:
        'El Auditorio es un espacio destinado a actividades institucionales, capacitaciones, reuniones, actos y otros eventos de la Fiscalía Departamental de Potosí.',
    questions: [
      OfficeQuestion(
        question:
            '¿Cuál es una de las principales funciones del Ministerio Público?',
        options: [
          'A) Defender la legalidad y los intereses generales de la sociedad.',
          'B) Dictar sentencias judiciales.',
          'C) Aprobar leyes.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Quién dirige la investigación de los delitos de acción pública?',
        options: [
          'A) El Ministerio Público.',
          'B) El juez civil.',
          'C) El personal administrativo.',
        ],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué principio exige que el fiscal actúe buscando tanto elementos favorables como desfavorables al imputado?',
        options: ['A) Objetividad.', 'B) Favoritismo.', 'C) Arbitrariedad.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Puede una persona ser condenada sin haber sido sometida al debido proceso?',
        options: ['A) No.', 'B) Sí.', 'C) Siempre que exista una denuncia.'],
        correctIndex: 0,
      ),
      OfficeQuestion(
        question:
            '¿Qué ley regula la organización, atribuciones y funcionamiento del Ministerio Público?',
        options: [
          'A) Ley N.º 260.',
          'B) Ley de Tránsito.',
          'C) Código de Comercio.',
        ],
        correctIndex: 0,
      ),
    ],
  ),
];
