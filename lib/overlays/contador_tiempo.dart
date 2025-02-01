import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

/// Componente de texto que muestra el contador de tiempo en pantalla.
class ContadorTiempo extends TextComponent with HasGameRef<Cajapocalipsis> {
  double tiempoRestante;

  /// Constructor que inicializa el contador con un tiempo predeterminado de 30 segundos.
  ContadorTiempo({this.tiempoRestante = 30})
      : super(
          text: "Tiempo: 30",
          anchor:
              Anchor.topRight, // Ancla el texto en la esquina superior derecha.
        );

  @override
  Future<void> onLoad() async {
    textRenderer = TextPaint(
      style: const TextStyle(
          fontSize: 24, color: Colors.white), // Estilo del texto.
    );

    // Posiciona el contador en la esquina superior derecha con un margen de 10 píxeles.
    position = Vector2(gameRef.size.x - 10, 10);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Reduce el tiempo restante si aún no ha llegado a cero.
    if (tiempoRestante > 0) {
      tiempoRestante -= dt;
      if (tiempoRestante < 0) {
        tiempoRestante = 0; // Asegura que no haya valores negativos.
      }

      // Actualiza el texto con el tiempo restante, redondeado a segundos enteros.
      text = "Tiempo: ${tiempoRestante.toStringAsFixed(0)}";
    }
  }
}
