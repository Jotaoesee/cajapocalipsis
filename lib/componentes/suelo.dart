import 'package:flame_forge2d/flame_forge2d.dart';

/// Suelo del juego donde caerán los objetos
class Suelo extends BodyComponent {
  final Vector2 tamanio;

  Suelo(this.tamanio) {
    renderBody = false; //  Hace que el suelo NO se renderice visualmente
  }

  @override
  Body createBody() {
    final definicionCuerpo = BodyDef(
      position:
          Vector2(tamanio.x / 2, tamanio.y + 720), // Mantener ajuste manual
      type: BodyType.static,
    );

    final body = world.createBody(definicionCuerpo);

    final forma = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final definicionFixture = FixtureDef(forma)
      ..density = 1.0
      ..friction = 0.5
      ..restitution = 0.1;

    body.createFixture(definicionFixture);
    return body;
  }
}
