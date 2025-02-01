import 'package:flame/components.dart';

/// Representa el fondo del juego, cargando una imagen de fondo y ajustándola al tamaño de la pantalla.
class Fondo extends SpriteComponent with HasGameRef {
  /// Carga la imagen de fondo y ajusta su tamaño a la pantalla del juego.
  @override
  Future<void> onLoad() async {
    try {
      sprite =
          await gameRef.loadSprite('fondo.png'); // Carga la imagen del fondo
      size = gameRef.size; // Ajusta el tamaño de la imagen al tamaño del juego
      print("✅ Imagen de fondo cargada correctamente");
    } catch (e) {
      print("❌ Error cargando fondo: $e");
    }
  }
}
