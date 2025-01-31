import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

/// Dinamita que se lanza desde el lanzador
class Dinamita extends BodyComponent {
  final Vector2 posicion;
  final Vector2 tamanio;
  late Body
      _body; //  Se asegurará de que el cuerpo se inicialice antes de usarlo

  Dinamita(this.posicion, {Vector2? tamanio})
      : tamanio = tamanio ?? Vector2(20, 40);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final game = findGame() as Forge2DGame;

    final sprite = await Sprite.load('dinamita.png');

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

    _body = world.createBody(bodyDef); // 📌 Guardamos el cuerpo en _body

    final shape = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final fixtureDef = FixtureDef(shape)
      ..density = 1.0
      ..friction = 0.3
      ..restitution = 0.2;

    _body.createFixture(fixtureDef);
    return _body;
  }

  /// 📌 Método seguro para lanzar la dinamita
  void lanzar(Vector2 fuerza) {
    if (!isMounted || _body == null) {
      print("❌ Intentando lanzar antes de que el cuerpo esté listo");
      return;
    }
    print("💥 Lanzando dinamita con fuerza: $fuerza");
    _body.applyLinearImpulse(fuerza);
  }
}
