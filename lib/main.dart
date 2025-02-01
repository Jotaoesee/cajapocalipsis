import 'package:cajapocalipsis/overlays/menu_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart'; // Asegúrate de que la ruta es correcta

void main() {
  final juego = Cajapocalipsis();
  runApp(
    GameWidget(
      game: juego,
      // Se activa el overlay de inicio al arrancar el juego
      initialActiveOverlays: const ['MenuOverlay'],
      overlayBuilderMap: {
        'MenuOverlay': (BuildContext context, Cajapocalipsis juego) {
          return MenuOverlay(juego: juego);
        },
      },
    ),
  );
}
