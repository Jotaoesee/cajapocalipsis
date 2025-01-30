import 'package:cajapocalipsis/cajapocalipsis.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: Cajapocalipsis(), // Instanciamos el juego
    ),
  );
}
