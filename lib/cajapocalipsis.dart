import 'dart:math';
import 'package:cajapocalipsis/overlays/contador_tiempo.dart';
import 'package:cajapocalipsis/overlays/texto_puntuacion.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'componentes/fondo.dart';
import 'componentes/suelo.dart';
import 'componentes/caja.dart';
import 'componentes/lanzador.dart';
import 'componentes/dinamita.dart';

/// **Clase principal del juego**
/// Gestiona la física, eventos y lógica del juego.
class Cajapocalipsis extends Forge2DGame with TapDetector {
  Cajapocalipsis() : super(gravity: Vector2(0, 10));

  final Random aleatorio = Random();
  late Lanzador lanzador;
  int puntuacion = 0; // Número de cajas destruidas
  bool juegoTerminado = false; // Estado del juego
  late ContadorTiempo contadorTiempo;
  List<Caja> listaCajas = []; // Lista de cajas generadas

  /// **Carga inicial del juego**
  @override
  Future<void> onLoad() async {
    print("🛠️ Cargando Cajapocalipsis con físicas...");

    add(Fondo()); // Agregar fondo de pantalla

    final suelo = Suelo(Vector2(size.x, 10));
    await add(suelo); // Agregar el suelo

    // **Generación de cajas aleatorias**
    for (int i = 0; i < 10; i++) {
      final double x = aleatorio.nextDouble() * (size.x - 10) + 5;
      final double y = aleatorio.nextDouble() * (size.y / 3);
      Caja caja = Caja(Vector2(x, y), Vector2(100, 100));
      listaCajas.add(caja);
      add(caja);
    }

    // **Creación del lanzador**
    final posicionLanzador = Vector2(size.x / 2, size.y - 100);
    lanzador = Lanzador(posicionLanzador);
    add(lanzador);

    // **Agregar HUD (contador de tiempo y puntuación)**
    contadorTiempo = ContadorTiempo();
    add(contadorTiempo);
    add(TextoPuntuacion());

    print("✅ Juego iniciado correctamente.");
  }

  /// **Actualizar estado del juego en cada frame**
  @override
  void update(double dt) {
    super.update(dt);
    if (!juegoTerminado) {
      // **Finaliza el juego si se destruyen todas las cajas**
      if (puntuacion >= listaCajas.length) {
        terminarJuego("¡Has destruido todas las cajas!");
      }
      // **Finaliza el juego si el tiempo llega a 0**
      if (contadorTiempo.tiempoRestante <= 0) {
        terminarJuego("¡Tiempo agotado!");
      }
    }
  }

  /// **Lógica de finalización del juego**
  void terminarJuego(String mensaje) {
    juegoTerminado = true;
    print("🎮 Juego terminado: $mensaje");

    // Mostrar la pantalla de puntuación final
    overlays.add('PuntuacionFinalOverlay');
  }

  /// **Evento de toque en la pantalla**
  @override
  void onTapDown(TapDownInfo info) {
    if (juegoTerminado) return; // Si el juego ha terminado, ignorar toques

    FlameAudio.play('disparo_lanzador.mp3');

    final Vector2 puntoObjetivo = info.eventPosition.global;
    print("🎯 Click detectado en: $puntoObjetivo");

    // **Calcular dirección y aplicar fuerza al proyectil**
    Vector2 direccion = puntoObjetivo - lanzador.position;
    if (direccion.length > 0) {
      direccion.normalize();
    }

    final Vector2 fuerza = direccion * 800000;
    final Vector2 desplazamiento = Vector2(100, -120);
    final Vector2 nuevaPosicion = lanzador.position + desplazamiento;
    final dinamita = Dinamita(nuevaPosicion, fuerza);

    add(dinamita);
    FlameAudio.play('lanzamiento.mp3');
  }
}
