import 'package:flame_forge2d/flame_forge2d.dart';

/// Caja que se puede derribar
class Caja extends BodyComponent {
  final Vector2 tamanio;
  final Vector2 posicion;

  Caja(this.posicion, this.tamanio) : super();

  @override
  Future<void> onLoad() async {
    await super.onLoad(); // Esperar a que el cuerpo se cree
    renderBody = true;
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
