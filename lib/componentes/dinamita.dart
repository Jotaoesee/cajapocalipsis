import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';

class Dinamita extends BodyComponent {
  final Vector2 posicion;
  final Vector2 _fuerzaInicial;
  final Vector2 spriteSize; // Tamaño del sprite en píxeles
  final Vector2 bodySize; // Tamaño del cuerpo de física en unidades de física

  late Body _body;

  // Constructor con tamaños separados
  Dinamita(
    this.posicion,
    this._fuerzaInicial, {
    Vector2? spriteSize,
    Vector2? bodySize,
  })  : spriteSize =
            spriteSize ?? Vector2(120, 160), // Tamaño por defecto del sprite
        bodySize = bodySize ??
            Vector2(40, 60); // Tamaño por defecto del cuerpo de física

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Cargar el sprite de la dinamita
    final sprite = await Sprite.load('dinamita.png');

    // Agregar el SpriteComponent con el tamaño definido
    add(SpriteComponent(
      sprite: sprite,
      size: spriteSize,
      anchor: Anchor.center, // Centrar el sprite
      position: Vector2.zero(),
    ));

    print("💣 Dinamita creada en: $posicion");
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: posicion,
      type: BodyType.dynamic,
      linearDamping: 0.0,
      angularDamping: 0.5,
    );
    _body = world.createBody(bodyDef);
    _body.userData =
        this; // Asigna userData para que se detecten las colisiones

    final shape = PolygonShape()..setAsBoxXY(bodySize.x / 2, bodySize.y / 2);
    final fixtureDef = FixtureDef(shape)
      ..density = 2.0
      ..friction = 0.3
      ..restitution = 0.1
      ..filter.maskBits = 0xFFFF;
    _body.createFixture(fixtureDef);

    final Vector2 impulso = _fuerzaInicial;
    print("💥 Lanzando dinamita con fuerza: $impulso");
    _body.applyLinearImpulse(impulso);

    return _body;
  }
}
