import 'package:flame/components.dart';
import 'package:flame_forge2d/forge2d_game.dart';

import 'componentes/suelo.dart';

/// Clase principal del juego
class Cajapocalipsis extends Forge2DGame {
  Cajapocalipsis() : super(gravity: Vector2(0, 10));

  @override
  Future<void> onLoad() async {
    print("Juego Cajapocalipsis cargado con físicas");

    // Agregamos el suelo
    final suelo = Suelo(Vector2(size.x, 10));
    add(suelo);
  }
}
