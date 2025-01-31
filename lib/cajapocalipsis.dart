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
    add(suelo);

    // Generamos cajas en posiciones aleatorias
    for (int i = 0; i < 5; i++) {
      final double x = random.nextDouble() * (size.x - 10) + 5;
      final double y = random.nextDouble() * (size.y / 3);
      add(Caja(Vector2(x, y), Vector2(100, 100)));
    }

    //Definir la posición del lanzador en la parte baja de la pantalla
    final posicionLanzador =
        Vector2(size.x / 2, size.y - 100); // Subirlo un poco
    lanzador = Lanzador(posicionLanzador);
    add(lanzador);
  }

  @override
  void onTap() {
    print("🔥 Lanzando dinamita!");

    // Crear y lanzar la dinamita desde la posición del lanzador
    final dinamita = Dinamita(lanzador.position);
    add(dinamita);
    dinamita.lanzar(Vector2(15, -20)); // Ajusta la fuerza del lanzamiento
  }
}
