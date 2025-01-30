import 'dart:math';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'componentes/suelo.dart';
import 'componentes/caja.dart';
import 'componentes/pelota.dart';

/// Clase principal del juego
class Cajapocalipsis extends Forge2DGame with TapDetector {
  Cajapocalipsis() : super(gravity: Vector2(0, 10));

  final Random random = Random();
  late Pelota pelota;

  @override
  Future<void> onLoad() async {
    print("Juego Cajapocalipsis cargado con físicas");

    // Agregamos el suelo
    final suelo = Suelo(Vector2(size.x, 10));
    add(suelo);

    // Generamos cajas en posiciones aleatorias
    for (int i = 0; i < 5; i++) {
      final double x = random.nextDouble() * (size.x - 10) + 5;
      final double y = random.nextDouble() * (size.y / 3);
      add(Caja(Vector2(x, y), Vector2(4, 4)));
    }

    // 📌 Posición corregida para que la pelota sea visible
    pelota = Pelota(Vector2(size.x / 2, size.y - 200));
    add(pelota);
  }

  @override
  void onTap() {
    print("Lanzando pelota");
    pelota.lanzar(Vector2(15, -20));
  }
}
