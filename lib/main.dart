import 'package:cajapocalipsis/overlays/menu_overlay.dart';
import 'package:cajapocalipsis/overlays/puntuacion_final_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart'; // Asegúrate de que la ruta es correcta

void main() {
  final juego = Cajapocalipsis();
  runApp(
    GameWidget(
      game: juego,
      initialActiveOverlays: const ['MenuOverlay'],
      overlayBuilderMap: {
        'MenuOverlay': (context, game) =>
            MenuOverlay(juego: game as Cajapocalipsis),
        'PuntuacionFinalOverlay': (context, game) =>
            PuntuacionFinalOverlay(juego: game as Cajapocalipsis),
      },
    ),
  );
}
