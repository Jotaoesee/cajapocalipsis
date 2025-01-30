import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'componentes/suelo.dart';
import 'componentes/caja.dart';

/// Clase principal del juego
class Cajapocalipsis extends Forge2DGame {
  Cajapocalipsis() : super(gravity: Vector2(0, 10));

  final Random random = Random();

  @override
  Future<void> onLoad() async {
    print("Juego Cajapocalipsis cargado con físicas");

    // Agregamos el suelo
    final suelo = Suelo(Vector2(size.x, 10));
    add(suelo);

    // Generamos cajas en posiciones aleatorias
    for (int i = 0; i < 5; i++) {
      final double x = random.nextDouble() * (size.x - 10) + 5; // Evitar bordes
      final double y =
          random.nextDouble() * (size.y / 3); // Posición en el aire

      add(Caja(Vector2(x, y), Vector2(4, 4)));
    }
  }
}
