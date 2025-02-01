import 'dart:ui';
import 'package:cajapocalipsis/componentes/explosion.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:cajapocalipsis/componentes/dinamita.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

class Caja extends BodyComponent<Cajapocalipsis>
    with ContactCallbacks, HasGameRef<Cajapocalipsis> {
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
    final definicionCuerpo = BodyDef(
      position: posicion,
      type: BodyType.dynamic,
    );
    final cuerpo = world.createBody(definicionCuerpo);
    cuerpo.userData = this; // Importante para detectar colisiones
    final shape = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final definicionFixture = FixtureDef(shape)
      ..density = 1.0
      ..friction = 0.5
      ..restitution = 0.2;
    cuerpo.createFixture(definicionFixture);
    return cuerpo;
  }

  @override
  void beginContact(Object otro, Contact contact) {
    super.beginContact(otro, contact);
    if (otro is Dinamita) {
      print("¡Colisión detectada entre Caja y Dinamita!");
      // Incrementa la puntuación en la clase principal
      gameRef.puntuacion++;
      final posicionExplosion = body.position;
      final explosion = Explosion(
        posicion: posicionExplosion,
        tamanio: Vector2.all(50), // Tamaño reducido para la explosión
      )..priority = 100;
      gameRef.add(explosion);

      removeFromParent();
      otro.removeFromParent();
    }
  }
}
