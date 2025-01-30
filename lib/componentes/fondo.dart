import 'package:flame/components.dart';

class Fondo extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    try {
      sprite = await gameRef.loadSprite('fondo.png'); // Ruta correcta
      size = gameRef.size;
      print("✅ Imagen de fondo cargada correctamente");
    } catch (e) {
      print("❌ Error cargando fondo: $e");
    }
  }
}
