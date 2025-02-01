import 'dart:math';
import 'package:cajapocalipsis/componentes/dinamita.dart';
import 'package:cajapocalipsis/componentes/fondo.dart';
import 'package:cajapocalipsis/componentes/lanzador.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'componentes/suelo.dart';
import 'componentes/caja.dart';

/// Clase principal del juego
class Cajapocalipsis extends Forge2DGame with TapDetector {
  // Constructor del juego (no se puede cambiar el nombre del parámetro 'gravity' ya que es parte de la API)
  Cajapocalipsis() : super(gravity: Vector2(0, 10));

  final Random aleatorio = Random();
  late Lanzador lanzador;

  @override
  Future<void> onLoad() async {
    print("Juego Cajapocalipsis cargado con físicas");

    // Agregar el fondo
    add(Fondo());

    // Agregar el suelo
    final suelo = Suelo(Vector2(size.x, 10));
    await add(suelo); // 🔥 Asegurarse de que se añada correctamente

    // Generar cajas en posiciones aleatorias
    for (int i = 0; i < 5; i++) {
      final double x = aleatorio.nextDouble() * (size.x - 10) + 5;
      final double y = aleatorio.nextDouble() * (size.y / 3);
      add(Caja(Vector2(x, y), Vector2(100, 100)));
    }

    // Agregar el lanzador en la posición deseada
    final posicionLanzador = Vector2(size.x / 2, size.y - 100);
    lanzador = Lanzador(posicionLanzador);
    add(lanzador);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // Reproducir el efecto de sonido del lanzador al disparar
    FlameAudio.play('disparo_lanzador.mp3');

    final Vector2 puntoObjetivo = info.eventPosition.global;
    print("🎯 Click detectado en: $puntoObjetivo");

    // Calcular la dirección normalizada desde el lanzador hacia el punto de toque
    Vector2 direccion = puntoObjetivo - lanzador.position;
    if (direccion.length > 0) {
      direccion.normalize();
    }

    // Aplicar un impulso (fuerza) mayor en la dirección calculada
    final Vector2 fuerza = direccion * 80000; // Ajuste de fuerza

    // Definir un desplazamiento relativo para la posición de aparición del dinamita
    final Vector2 desplazamiento = Vector2(100, -120);

    // Calcular la nueva posición de aparición
    final Vector2 nuevaPosicion = lanzador.position + desplazamiento;

    // Crear dinamita en la nueva posición y lanzarla
    final dinamita = Dinamita(nuevaPosicion, fuerza);
    add(dinamita);
    FlameAudio.play('lanzamiento.mp3');
  }
}
