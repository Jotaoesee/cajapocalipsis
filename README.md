💣 Cajapocalipsis: ¡Demolición con Física Extrema! 💥
Descripción del Proyecto
Cajapocalipsis es un emocionante juego de arcade 2D desarrollado con Flutter y el potente motor de juegos Flame, que incorpora físicas realistas gracias a Flame Forge2D. En este caótico y divertido desafío, tu misión es simple: ¡destruir todas las cajas! Utiliza un lanzador para disparar dinamita con precisión y desatar explosiones que harán volar los obstáculos en un entorno interactivo y basado en la física. Compite contra el reloj y contra la cantidad de cajas para ver qué tan rápido puedes lograr la demolición total.

El Problema que Resuelve
Cajapocalipsis ofrece una experiencia de juego casual y adictiva para:

Aliviar el estrés: La satisfacción de destruir objetos con físicas realistas es sorprendentemente gratificante.

Desafío de precisión y estrategia: Planifica tus lanzamientos de dinamita para optimizar la destrucción y superar los niveles.

Diversión rápida y accesible: Un juego fácil de entender y jugar en sesiones cortas, perfecto para cualquier momento.

¿Para Quién es Útil?
Este proyecto es ideal para:

Jugadores casuales: Que buscan juegos divertidos, rápidos y con mecánicas intuitivas.

Amantes de los juegos de física: Quienes disfrutan viendo cómo los objetos interactúan de forma realista.

Desarrolladores de Flutter y Flame: Sirve como un excelente ejemplo práctico de un juego 2D con:

Integración de un motor de física (Flame Forge2D).

Gestión de eventos de toque (TapDetector).

Animaciones de sprites y efectos visuales.

Controles de juego sencillos y mecánicas de puntuación.

Uso de componentes reutilizables (Caja, Dinamita, Explosión, Lanzador, Suelo, Fondo).

Implementación de HUD (Head-Up Display) con contador de tiempo y puntuación.

✨ Características Destacadas
💥 Física de Destrucción con Forge2D: Observa cómo las cajas reaccionan de manera realista a los impactos y explosiones gracias a un motor de física 2D avanzado.

🎯 Mecánica de Lanzamiento Intuitiva: Lanza dinamita simplemente tocando la pantalla para definir la dirección y el poder del disparo.

📦 Objetivos Destructibles: Explota cajas dinámicas que se dispersan y reaccionan de forma auténtica.

⏱️ Juego Basado en Tiempo y Puntuación: Compite contra un temporizador y el número de cajas a destruir para lograr la máxima puntuación.

🎇 Efectos Visuales Impresionantes: Disfruta de animaciones de explosión fluidas al destruir las cajas.

🖼️ Elementos de Escenario Dinámicos: Un fondo atractivo y un suelo interactivo que afectan la física del juego.

🔊 Efectos de Sonido Inmersivos: Sonidos para el lanzamiento de la dinamita y las explosiones para una experiencia más envolvente.

📈 HUD Completo: Un contador de tiempo y un display de puntuación te mantienen informado en todo momento.

🏁 Pantalla de Puntuación Final: Una vez que el tiempo se agota o todas las cajas son destruidas, se muestra tu rendimiento final.

🛠️ Tecnologías Utilizadas
Lenguaje de Programación: Dart

Framework de Desarrollo: Flutter

Motor de Juegos: Flame

Motor de Física 2D: Flame Forge2D

Gestión de Audio: flame_audio

Gestión de Eventos: flame/events (TapDetector)

Componentes de Flame: SpriteComponent, SpriteAnimationComponent, BodyComponent, PositionComponent.

Herramientas para Sprites: SpriteSheet.

🚀 Cómo Instalar y Ejecutar
Para disfrutar de Cajapocalipsis en tu entorno local, asegúrate de tener Flutter y las dependencias del juego correctamente configuradas.

Prerrequisitos
Flutter SDK: Se recomienda la última versión estable.

Un editor de código (VS Code, Android Studio).

Un dispositivo o emulador configurado para ejecutar aplicaciones Flutter.

Pasos de Instalación
Clona el repositorio:

git clone https://github.com/tu_usuario/cajapocalipsis.git
cd cajapocalipsis

(Nota: Reemplaza https://github.com/tu_usuario/cajapocalipsis.git con la URL real de tu repositorio.)

Instala las dependencias de Flutter:

flutter pub get

Asegúrate de tener los assets en la carpeta correcta:
Verifica que las imágenes y los archivos de audio mencionados en el código (caja.png, dinamita.png, explosion.png, fondo.png, lanzador.png, disparo_lanzador.mp3, lanzamiento.mp3) estén ubicados en la carpeta assets/images/ y assets/audio/ respectivamente, y que estén declarados en tu archivo pubspec.yaml bajo la sección assets.

Ejemplo de pubspec.yaml:

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/audio/

Cómo Ejecutar el Juego
Ejecuta la aplicación:

flutter run

El juego se lanzará en el dispositivo o emulador que tengas configurado.

📈 Cómo Jugar
Cajapocalipsis es un juego de demolición basado en la física. ¡Tu objetivo es destruir todas las cajas antes de que el tiempo se agote!

Objetivo del Juego
Destruir las 10 cajas generadas aleatoriamente en el escenario.

Completar el objetivo antes de que el temporizador llegue a cero.

Controles
Lanzar Dinamita: Simplemente toca (o haz clic con el ratón) en cualquier parte de la pantalla. La dinamita será disparada desde el lanzador (ubicado en la parte inferior central) hacia el punto donde tocaste. La fuerza del lanzamiento se calcula automáticamente en función de la distancia al punto de toque.

Mecánica de Juego
Inicio: Al iniciar el juego, verás un lanzador en la parte inferior central, un fondo, un suelo y 10 cajas distribuidas aleatoriamente por la parte superior del escenario. Un contador de tiempo y tu puntuación inicial (0) serán visibles.

Lanzamiento: Toca la pantalla para disparar una pieza de dinamita. Se reproducirá un sonido de lanzamiento.

Física: La dinamita caerá y rebotará según las leyes de la física, colisionando con las cajas y el suelo.

Destrucción de Cajas: Cuando una dinamita colisiona con una caja, la caja será destruida, se generará una animación de explosión en su lugar, tu puntuación aumentará en 1, y tanto la caja como la dinamita desaparecerán. Se reproducirá un sonido de explosión.

Fin del Juego: El juego terminará en dos situaciones:

Si logras destruir todas las cajas.

Si el contador de tiempo llega a cero.

Puntuación Final: Al finalizar el juego, se mostrará una pantalla con tu puntuación y un mensaje indicando el resultado.
