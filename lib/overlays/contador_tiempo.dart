import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

class ContadorTiempo extends TextComponent with HasGameRef<Cajapocalipsis> {
  double tiempoRestante;

  ContadorTiempo({this.tiempoRestante = 30})
      : super(
          text: "Tiempo: 30",
          anchor: Anchor.topRight,
        );

  @override
  Future<void> onLoad() async {
    // Configura el estilo del texto
    textRenderer = TextPaint(
      style: const TextStyle(fontSize: 24, color: Colors.white),
    );
    // Ubicar el contador en la esquina superior derecha con un margen de 10 píxeles
    position = Vector2(gameRef.size.x - 10, 10);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (tiempoRestante > 0) {
      tiempoRestante -= dt;
      if (tiempoRestante < 0) {
        tiempoRestante = 0;
      }
      // Actualiza el texto para mostrar el tiempo restante redondeado a entero
      text = "Tiempo: ${tiempoRestante.toStringAsFixed(0)}";
    }
  }
}
