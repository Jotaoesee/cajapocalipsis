import 'dart:ui';
import 'package:cajapocalipsis/componentes/explosion.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:cajapocalipsis/componentes/dinamita.dart';
import 'package:flame_forge2d/forge2d_game.dart';

// Usamos HasGameRef<Forge2DGame> para poder acceder a gameRef
class Caja extends BodyComponent
    with ContactCallbacks, HasGameRef<Forge2DGame> {
  final Vector2 tamanio;
  final Vector2 posicion;

  Caja(this.posicion, this.tamanio);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

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
    final bodyDef = BodyDef(
      position: posicion,
      type: BodyType.dynamic,
    );
    final body = world.createBody(bodyDef);
    body.userData = this; // Aseguramos que el cuerpo tenga su userData asignado

    final shape = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final fixtureDef = FixtureDef(shape)
      ..density = 1.0
      ..friction = 0.5
      ..restitution = 0.2;
    body.createFixture(fixtureDef);
    return body;
  }

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is Dinamita) {
      print("¡Colisión detectada entre Caja y Dinamita!");
      final explosionPos = body.position;
      final explosion = Explosion(
        posicion: explosionPos,
        tamanio: Vector2.all(50),
      )..priority = 100;
      gameRef.add(explosion);

      removeFromParent();
      other.removeFromParent();
    }
  }
}
