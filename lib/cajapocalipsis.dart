import 'dart:math';
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
  int puntuacion = 0; // Puntuación inicial

  @override
  Future<void> onLoad() async {
    print("Juego Cajapocalipsis cargado con físicas");

    add(Fondo());

    final suelo = Suelo(Vector2(size.x, 10));
    await add(suelo);

    for (int i = 0; i < 10; i++) {
      final double x = aleatorio.nextDouble() * (size.x - 10) + 5;
      final double y = aleatorio.nextDouble() * (size.y / 3);
      add(Caja(Vector2(x, y), Vector2(100, 100)));
    }

    final posicionLanzador = Vector2(size.x / 2, size.y - 100);
    lanzador = Lanzador(posicionLanzador);
    add(lanzador);

    // Asegúrate de que el nombre del componente de texto coincide con el de su clase
    add(TextoPuntuacion());
  }

  @override
  void onTapDown(TapDownInfo info) {
    FlameAudio.play('assets/audio/disparo_lanzador.mp3');

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

    FlameAudio.play('assets/audio/lanzamiento.mp3');
  }
}
