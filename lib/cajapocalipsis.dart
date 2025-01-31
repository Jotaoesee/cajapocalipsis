import 'dart:math';
import 'package:cajapocalipsis/componentes/dinamita.dart';
import 'package:cajapocalipsis/componentes/fondo.dart';
import 'package:cajapocalipsis/componentes/lanzador.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'componentes/suelo.dart';
import 'componentes/caja.dart';

/// Clase principal del juego
class Cajapocalipsis extends Forge2DGame with TapDetector {
  Cajapocalipsis() : super(gravity: Vector2(0, 10));

  final Random random = Random();
  late Lanzador lanzador;

  @override
  Future<void> onLoad() async {
    print("Juego Cajapocalipsis cargado con físicas");

    add(Fondo()); // Agregar el fondo primero

    // Agregamos el suelo
    final suelo = Suelo(Vector2(size.x, 10));
    await add(suelo); // 🔥 Asegurar que se añada correctamente

    // Generamos cajas en posiciones aleatorias
    for (int i = 0; i < 5; i++) {
      final double x = random.nextDouble() * (size.x - 10) + 5;
      final double y = random.nextDouble() * (size.y / 3);
      add(Caja(Vector2(x, y), Vector2(100, 100)));
    }

    final posicionLanzador = Vector2(size.x / 2, size.y - 100);
    lanzador = Lanzador(posicionLanzador);
    add(lanzador);
  }

  @override
  void onTapDown(TapDownInfo info) {
    final Vector2 puntoObjetivo = info.eventPosition.global;
    print("🎯 Click detectado en: $puntoObjetivo");

    //  Calcular dirección normalizada desde el lanzador
    Vector2 direccion = puntoObjetivo - lanzador.position;
    if (direccion.length > 0) {
      direccion.normalize();
    }

    //  Aplicamos un impulso más fuerte
    final Vector2 fuerza = direccion * 80000; // Ajuste de fuerza

    //  Crear dinamita en la posición del lanzador y lanzarla
    final dinamita = Dinamita(lanzador.position, fuerza);
    add(dinamita);
  }
}
