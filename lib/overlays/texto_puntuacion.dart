import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

/// Componente de texto que muestra la puntuación del jugador en la pantalla.
class TextoPuntuacion extends TextComponent with HasGameRef<Cajapocalipsis> {
  TextoPuntuacion()
      : super(
          text: "Puntuación: 0",
          position:
              Vector2(10, 10), // Ubicación en la esquina superior izquierda.
          anchor: Anchor.topLeft,
        );

  @override
  Future<void> onLoad() async {
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Actualiza el texto para reflejar la puntuación actual del jugador.
    text = "Puntuación: ${gameRef.puntuacion}";
  }
}
