import 'package:flame_forge2d/flame_forge2d.dart';

/// Suelo del juego donde caerán los objetos
class Suelo extends BodyComponent {
  final Vector2 tamanio;

  Suelo(this.tamanio) {
    print("🛠️ Creando suelo con tamaño: $tamanio");
    renderBody = false;
  }

  @override
  Body createBody() {
    print(
        "✅ Creando cuerpo del suelo en: ${tamanio.x / 2}, ${tamanio.y + 520}");

    final definicionCuerpo = BodyDef(
      position: Vector2(tamanio.x / 2, tamanio.y + 720),
      type: BodyType.static,
    );

    final body = world.createBody(definicionCuerpo);

    final forma = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final definicionFixture = FixtureDef(forma)
      ..density = 1.0
      ..friction = 0.5
      ..restitution = 0.1;

    body.createFixture(definicionFixture);

    print(
        "✅ Suelo creado en Forge2D en posición: ${definicionCuerpo.position}");
    return body;
  }
}
