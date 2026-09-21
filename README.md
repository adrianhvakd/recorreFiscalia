# Recorre tu Fiscalía

Juego educativo Flutter, sin conexión ni cuentas, para conocer las 27 oficinas de la Fiscalía Departamental de Potosí. Cada tótem ejecuta una partida independiente. No necesita servidor, API ni acceso a internet durante el juego.

## Reglas

1. Empiezas en la casilla 1 y lanzas dos dados de seis caras.
2. La suma elige la oficina de destino, sin mover todavía al jugador. Si sobrepasa el tablero, el destino es la casilla 27.
3. Lees la descripción de la oficina y respondes una pregunta elegida al azar entre sus cinco preguntas. Cada visita realiza un nuevo sorteo, por lo que puede repetirse una pregunta.
4. Si aciertas, avanzas hasta el destino. Si fallas, retrocedes **2 casillas desde tu posición actual**, sin bajar de la casilla 1. Siempre ves la respuesta correcta de esa oficina.
5. Responder correctamente la pregunta del auditorio (27) y continuar completa el recorrido. No hace falta una tirada exacta.

Solo puede haber un turno activo. Puedes tocar oficinas para leerlas entre tiradas, pero explorarlas no cambia la posición ni permite ganar. La pantalla final muestra turnos, aciertos y oficinas descubiertas mediante retos; permite empezar un nuevo recorrido. Se conserva el mensaje del regalo especial del recurso original.

La sesión vuelve al inicio después de **3 minutos sin tocar la pantalla**, con un aviso durante los últimos 30 segundos. Una interacción renueva el tiempo. Volver al inicio manualmente pide confirmación. Las sesiones no se guardan tras cerrar la aplicación.

## Estructura

```text
lib/
  main.dart                 Inicialización y pantalla completa vertical
  app.dart                  Tema, sesión e inactividad
  data/offices.dart         Contenido de las 27 oficinas
  models/office.dart        Modelo de oficina y pregunta
  game/game_controller.dart Reglas, fases, bloqueo de turnos y movimiento
  screens/                  Inicio, juego y resultado final
  widgets/                  Tablero, panel de turno, dados y marco del tótem
  theme/app_theme.dart      Colores y tipografía
```

Para editar información institucional, usa `data/offices.dart`. Para cambiar el retroceso, usa `GameController.penalty`. La duración de inactividad se define en `app.dart`. Las 135 preguntas proceden de `BANCO DE 135 PREGUNTAS.md` y están incorporadas en `lib/data/offices.dart`; editar el Markdown no actualiza automáticamente el juego.

## Desarrollo y comprobación

Requiere un SDK Flutter compatible con Dart `^3.12.2` y, para Android, Java 17 y Android SDK.

```sh
flutter pub get
flutter analyze
flutter test
flutter run
flutter build apk --release --split-per-abi
```

Las pruebas verifican conservación de nombres y descripciones, las 135 preguntas del banco, selección aleatoria, tiradas repetidas, avance y retroceso, límites del tablero, cancelación de trabajo pendiente al reiniciar, final obligatorio, sesiones sucesivas, exploración, inactividad y distribución a distintas resoluciones. Las pruebas de 4K verifican el diseño; no miden FPS o RAM del tótem.

Para generar capturas de revisión con fuentes reales:

```sh
flutter test tool/render_previews_test.dart --dart-define=FLUTTER_SDK=/ruta/a/flutter
```

Las capturas se guardan en `build/previews/`.

## Instalación en los nueve tótems

Los APK por arquitectura se generan en `build/app/outputs/flutter-apk/`. Comprueba primero la arquitectura Android del equipo y usa la misma variante en los nueve si son idénticos. Por ADB:

```sh
adb shell getprop ro.product.cpu.abilist
adb install -r build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
```

El ejemplo de instalación supone `arm64-v8a`; para un sistema de 32 bits usa la variante `armeabi-v7a`. No se puede deducir la arquitectura únicamente de la ficha comercial.

La actividad mantiene la pantalla encendida mientras la aplicación está visible. Flutter solicita orientación vertical y modo inmersivo. **Esto no configura bloqueo administrado de Android ni inicio automático al encender**: esos aspectos deben resolverse con el modo quiosco del fabricante o la administración del dispositivo.

La configuración heredada utiliza `com.example.recorre_tu_fiscalia` y firma de depuración incluso para el APK release. Sirve para validación local; antes de distribuir una versión institucional definitiva, define identificador y clave de firma que se conservarán para futuras actualizaciones.

Antes de replicar la instalación, prueba un tótem sin Wi-Fi: arranque, lectura a distancia, altura de controles, respuestas rápidas, retorno al inicio, reinicio del equipo y varias horas de sesiones. Perfila en hardware real con `flutter run --profile`; compara fluidez y memoria tras varias partidas.

## Publicar una versión web en Firebase Hosting

Firebase Hosting sirve la versión web del juego. No requiere añadir Firebase SDK, Firestore ni autenticación a la aplicación. El APK instalado en los tótems sigue siendo independiente.

1. Crea un proyecto en https://console.firebase.google.com/ y copia su **ID del proyecto**.
2. Desde esta carpeta, con Flutter y Node.js disponibles, ejecuta:

```sh
npx firebase-tools login
npx firebase-tools projects:list
flutter build web --release
npx firebase-tools deploy --only hosting --project TU_PROJECT_ID
```

Sustituye `TU_PROJECT_ID` por el identificador real. `firebase.json` ya está preparado para servir `build/web`, con redirección a `index.html` y revalidación de caché. No necesitas ejecutar `firebase init` ni reemplazar el `index.html` generado.

Firebase mostrará la URL publicada al finalizar. Para actualizarla, vuelve a compilar y repite el comando de despliegue. Esta configuración publica en el sitio Hosting predeterminado del proyecto indicado; elige un proyecto dedicado si ya tienes otro sitio allí.

El alojamiento web no sustituye al APK para el uso offline de los tótems: no se ha implementado una estrategia offline de navegador. Para desplegar automáticamente desde GitHub se puede añadir posteriormente un flujo que compile Flutter antes de publicar.

Referencias: https://firebase.google.com/docs/hosting/quickstart y https://docs.flutter.dev/deployment/web.
