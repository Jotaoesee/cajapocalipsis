import 'package:flame/components.dart';

/// Lanzador de dinamita
class Lanzador extends PositionComponent {
  Lanzador(Vector2 posicion) {
    position = posicion; // Posicionamos el lanzador en la pantalla
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    try {
      final sprite = await Sprite.load('lanzador.png');
      print("✅ Imagen del lanzador cargada correctamente");

      add(SpriteComponent(
        sprite: sprite,
        size:
            Vector2(200, 200), // 📌 Aumentar tamaño temporalmente para pruebas
        anchor: Anchor.center,
      ));
    } catch (e) {
      print("❌ Error al cargar la imagen del lanzador: $e");
    }
  }
}
