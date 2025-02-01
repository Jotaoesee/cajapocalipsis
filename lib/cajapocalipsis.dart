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

/// Clase principal del juego
class Cajapocalipsis extends Forge2DGame with TapDetector {
  Cajapocalipsis() : super(gravity: Vector2(0, 10));

  final Random aleatorio = Random();
  late Lanzador lanzador;
  int puntuacion = 0; // Contador de cajas destruidas
  bool juegoTerminado = false; // Bandera para indicar si el juego ha terminado
  late ContadorTiempo contadorTiempo;
  List<Caja> listaCajas = []; // Lista de cajas generadas

  @override
  Future<void> onLoad() async {
    print("Juego Cajapocalipsis cargado con físicas");

    add(Fondo());

    final suelo = Suelo(Vector2(size.x, 10));
    await add(suelo);

    // Generar cajas en posiciones aleatorias
    for (int i = 0; i < 1; i++) {
      final double x = aleatorio.nextDouble() * (size.x - 10) + 5;
      final double y = aleatorio.nextDouble() * (size.y / 3);
      Caja caja = Caja(Vector2(x, y), Vector2(100, 100));
      listaCajas.add(caja);
      add(caja);
    }

    final posicionLanzador = Vector2(size.x / 2, size.y - 100);
    lanzador = Lanzador(posicionLanzador);
    add(lanzador);

    // Agregar el contador de tiempo en la esquina superior derecha
    contadorTiempo = ContadorTiempo();
    add(contadorTiempo);

    // **Agregar el texto de puntuación en la esquina superior izquierda**
    add(TextoPuntuacion());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!juegoTerminado) {
      // Si la puntuación alcanza la cantidad de cajas generadas, el juego termina
      if (puntuacion >= listaCajas.length) {
        terminarJuego("¡Has destruido todas las cajas!");
      }
      // Si el tiempo llega a 0, el juego termina
      if (contadorTiempo.tiempoRestante <= 0) {
        terminarJuego("¡Tiempo agotado!");
      }
    }
  }

  void terminarJuego(String mensaje) {
    juegoTerminado = true;
    print("Juego terminado: $mensaje");

    // Mostrar el overlay de fin del juego
    overlays.add('PuntuacionFinalOverlay');
  }

  @override
  void onTapDown(TapDownInfo info) {
    if (juegoTerminado) return; // Si el juego ha terminado, no hacer nada

    FlameAudio.play('disparo_lanzador.mp3');
    final Vector2 puntoObjetivo = info.eventPosition.global;
    print("🎯 Click detectado en: $puntoObjetivo");

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
