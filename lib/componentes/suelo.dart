import 'package:flame/components.dart';
import 'package:flame_forge2d/body_component.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

/// Suelo del juego donde caerán los objetos
class Suelo extends BodyComponent {
  final Vector2 tamanio; // tamanio del suelo

  Suelo(this.tamanio);

  @override
  Future<void> onLoad() async {
    final forma = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);

    final definicionCuerpo = BodyDef(
      position: Vector2(tamanio.x / 2, tamanio.y), // Posición en la parte baja
      type: BodyType.static, // El suelo no se mueve
    );

    final definicionFixture = FixtureDef(forma)
      ..density = 1.0
      ..friction = 0.5
      ..restitution = 0.1;

    body = world.createBody(definicionCuerpo)..createFixture(definicionFixture);
  }
}
