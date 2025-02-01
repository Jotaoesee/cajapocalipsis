import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame_forge2d/forge2d_game.dart';

class Explosion extends SpriteAnimationComponent with HasGameRef<Forge2DGame> {
  Explosion({
    required Vector2 posicion,
    required Vector2 tamanio,
  }) : super(
          position: posicion,
          size: tamanio,
          anchor: Anchor.center,
        ) {
    removeOnFinish = true;
  }

  @override
  Future<void> onLoad() async {
    final image = await gameRef.images.load('explosion.png');
    final spriteSheet = SpriteSheet(image: image, srcSize: Vector2(64, 64));
    animation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.05,
      to: 16,
      loop: false,
    );
  }
}
