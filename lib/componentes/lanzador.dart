import 'package:flame/components.dart';

/// Representa el lanzador de dinamita en el juego.
class Lanzador extends PositionComponent {
  /// Constructor que posiciona el lanzador en la pantalla.
  Lanzador(Vector2 posicion) {
    position = posicion;
  }

  /// Carga la imagen del lanzador y la agrega como un componente en pantalla.
  @override
  Future<void> onLoad() async {
    super.onLoad();
    try {
      final sprite =
          await Sprite.load('lanzador.png'); // Carga la imagen del lanzador
      print("✅ Imagen del lanzador cargada correctamente");

      add(SpriteComponent(
        sprite: sprite,
        size: Vector2(200, 200), // Tamaño del lanzador en pantalla
        anchor: Anchor.center, // Centra la imagen en su posición
      ));
    } catch (e) {
      print("❌ Error al cargar la imagen del lanzador: $e");
    }
  }
}
