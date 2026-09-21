# Recursos visuales y conservación del contenido

## Revisión de los recursos anteriores

- `tablero_fondo.png` e `inicio_fiscalia_potosi.png`: 1024 × 1536 (2:3), con rótulos y botones dibujados dentro del mapa. La pantalla objetivo es vertical 9:16. Al ampliar el bitmap se amplían también sus textos, sin recuperar nitidez.
- `mensaje_final.png`: contiene una X y un botón de regalo dibujados que no eran interactivos. La nueva pantalla usa controles reales y conserva el mensaje del regalo.
- `dado_1.png` a `dado_6.png`: se sustituyen en la interfaz por puntos dibujados con `CustomPainter`, nítidos a cualquier escala.
- `personaje_fiscalia.png`: se conserva; la aplicación limita el ancho de decodificación según su uso para reducir memoria.

Los archivos originales permanecen en `assets/`, pero solamente la ilustración nueva y el personaje se incluyen en el paquete de la aplicación.

## Ilustración nueva

Archivo: `assets/potosi_panorama_v2.png` (1536 × 1024).

Generada con la herramienta integrada `image_gen` a través de la habilidad `imagegen`. Es una ambientación ilustrada de Potosí, no una fotografía ni un plano del edificio real. No contiene rótulos, escudos o datos institucionales inventados. Se usa como portada y cabecera del tablero; las oficinas, preguntas y controles se dibujan en Flutter.

Prompt utilizado:

```text
Use case: illustration-story. Asset type: background illustration for a Flutter educational touch kiosk game called Recorre tu Fiscalía in Potosí, Bolivia. Create a polished landscape 1536x1024 editorial illustration of Potosí with Cerro Rico mountain dominating the background, warm terracotta colonial city rooftops and a pair of elegant colonial church towers, foreground a welcoming modern institutional building with pale stone walls and subtle green glass. Sophisticated clean softly shaded illustration, architectural shapes, warm ivory, sandstone, deep forest green and muted gold, clear afternoon sky. Spacious composition, no people, no text, no letters, no signage, no coats of arms or logos, no UI or buttons. This is evocative decorative artwork, not a map or factual architectural rendering. Must remain readable as a small header landscape; no tiny details. Calm civic educational mood.
```

## Contenido conservado

`test/fixtures/original_offices.json` es la extracción del contenido original previo a la refactorización. Las pruebas comparan los nombres, descripciones, 26 preguntas existentes, sus opciones y las respuestas correctas con `lib/data/offices.dart`.

La casilla 6 (Laboratorio y Genética) no tenía pregunta. Se añadió una pregunta basada en su descripción existente para que todas las tiradas tengan un reto. La pregunta 1 se conserva literalmente, aunque menciona la Plataforma de Atención al Público y su casilla se llama Ingreso y Orientación al Público.

Las etiquetas abreviadas del tablero se usan solo para facilitar lectura. El panel de cada oficina conserva su nombre completo. Los cinco pisos y el orden de las 27 casillas mantienen la distribución original.

## Escala y memoria

El ancho lógico es de 900 unidades y el alto se calcula con la proporción real del área disponible. En teléfonos verticales alargados y tótems se ocupa todo el ancho y alto, sin franjas de relleno ni deformación. El tablero y las ilustraciones aprovechan el espacio adicional. Si la pantalla es demasiado corta para el contenido mínimo (1600 unidades lógicas), se permite desplazamiento vertical para acceder a todos los controles. Se respetan las áreas seguras del sistema con el fondo de la aplicación. Esto no cambia la resolución de renderizado de Android. Los controles de respuesta están en la zona inferior. Los textos extensos tienen desplazamiento vertical, sin truncar las respuestas.

La ilustración se decodifica con un máximo de 1536 píxeles de ancho. Se evitan fondos 4K con texto rasterizado, desenfoques y animaciones permanentes. Sigue siendo necesario comprobar alcance táctil, densidad Android y fluidez en el tótem físico.
