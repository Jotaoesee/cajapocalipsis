import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

/// Dinamita que se lanza desde el lanzador
class Dinamita extends BodyComponent {
  final Vector2 posicion;
  final Vector2 tamanio;

  Dinamita(this.posicion, {Vector2? tamanio})
      : tamanio = tamanio ?? Vector2(20, 40);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final game = findGame() as Forge2DGame;

    // Cargar la imagen de la dinamita
    final sprite = await Sprite.load('dinamita.png');

    // Agregar la imagen de la dinamita
    add(SpriteComponent(
      sprite: sprite,
      size: tamanio,
      anchor: Anchor.center,
    ));
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: posicion,
      type: BodyType.dynamic,
    );

    final body = world.createBody(bodyDef);

    final shape = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final fixtureDef = FixtureDef(shape)
      ..density = 1.0
      ..friction = 0.3
      ..restitution = 0.2;

    body.createFixture(fixtureDef);
    return body;
  }

  /// Método para lanzar la dinamita con fuerza
  void lanzar(Vector2 fuerza) {
    body.applyLinearImpulse(fuerza);
  }
}
