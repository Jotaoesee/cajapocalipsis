import 'package:cajapocalipsis/overlays/menu_overlay.dart';
import 'package:cajapocalipsis/overlays/puntuacion_final_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

/// **Punto de entrada principal del juego**
/// - Inicializa `Cajapocalipsis` como el motor de juego.
/// - Configura los overlays para manejar menús y la pantalla final.
void main() {
  final juego = Cajapocalipsis(); // Instancia principal del juego

  runApp(
    GameWidget(
      game: juego,

      // **Iniciar con el menú principal**
      initialActiveOverlays: const ['MenuOverlay'],

      // **Definir los overlays disponibles**
      overlayBuilderMap: {
        'MenuOverlay': (context, game) =>
            MenuOverlay(juego: game as Cajapocalipsis),
        'PuntuacionFinalOverlay': (context, game) =>
            PuntuacionFinalOverlay(juego: game as Cajapocalipsis),
      },
    ),
  );
}
