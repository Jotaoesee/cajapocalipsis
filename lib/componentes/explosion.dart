import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame_forge2d/forge2d_game.dart';

/// Representa una animación de explosión cuando un objeto colisiona en el juego.
class Explosion extends SpriteAnimationComponent with HasGameRef<Forge2DGame> {
  /// Constructor de la explosión.
  /// - `posicion`: Ubicación donde aparecerá la explosión.
  /// - `tamanio`: Dimensiones de la explosión.
  Explosion({
    required Vector2 posicion,
    required Vector2 tamanio,
  }) : super(
          position: posicion,
          size: tamanio,
          anchor: Anchor.center,
        ) {
    removeOnFinish =
        true; // Se elimina automáticamente al finalizar la animación
  }

  /// Carga la animación de explosión a partir de un sprite sheet.
  @override
  Future<void> onLoad() async {
    final image = await gameRef.images.load('explosion.png');

    final spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2(64, 64), // Tamaño de cada frame en el sprite sheet
    );

    animation = spriteSheet.createAnimation(
      row: 0, // Asume que la explosión está en la primera fila
      stepTime: 0.05, // Velocidad de la animación
      to: 16, // Número total de frames
      loop: false, // No se repite
    );
  }
}
