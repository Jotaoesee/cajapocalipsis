import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

/// Caja que se puede derribar
class Caja extends BodyComponent {
  final Vector2 tamanio;
  final Vector2 posicion;

  Caja(this.posicion, this.tamanio);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final game = findGame() as Forge2DGame;

    //  Cargar la imagen con transparencia
    final sprite = await Sprite.load('caja.png');

    print("✅ Imagen de la caja cargada con transparencia: ${sprite.srcSize}");

    add(SpriteComponent(
      sprite: sprite,
      size: Vector2(118, 118),
      anchor: Anchor.center,
      paint: Paint()
        ..color = const Color(0xFFFFFFFF)
        ..blendMode = BlendMode.srcATop,
    ));
  }

  @override
  Body createBody() {
    final definicionCuerpo = BodyDef(
      position: posicion,
      type: BodyType.dynamic,
    );

    final body = world.createBody(definicionCuerpo);

    final forma = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final definicionFixture = FixtureDef(forma)
      ..density = 1.0
      ..friction = 0.5
      ..restitution = 0.2;

    body.createFixture(definicionFixture);
    return body;
  }
}
