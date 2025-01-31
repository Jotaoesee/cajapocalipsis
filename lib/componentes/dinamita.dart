import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

/// Dinamita que se lanza desde el lanzador
class Dinamita extends BodyComponent {
  final Vector2 posicion;
  final Vector2 tamanio;
  final Vector2 _fuerzaInicial;
  late Body _body;

  Dinamita(this.posicion, this._fuerzaInicial, {Vector2? tamanio})
      : tamanio = tamanio ?? Vector2(20, 40);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sprite = await Sprite.load('dinamita.png');

    add(SpriteComponent(
      sprite: sprite,
      size: tamanio,
      anchor: Anchor.center,
    ));

    print("💣 Dinamita creada en: $posicion");
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: posicion,
      type: BodyType.dynamic,
      linearDamping: 0.1, // 📌 Reducimos resistencia del aire
      angularDamping: 0.5, // 📌 Evita que la dinamita gire demasiado
    );

    _body = world.createBody(bodyDef);

    final shape = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final fixtureDef = FixtureDef(shape)
      ..density = 2.0 // 📌 Ajustar la densidad para mejorar el impulso
      ..friction = 0.3
      ..restitution = 0.1;

    _body.createFixture(fixtureDef);

    // 📌 Aplicamos el impulso después de asegurarnos de que el cuerpo está listo
    Future.delayed(Duration(milliseconds: 100), () {
      if (_body != null) {
        final Vector2 impulso =
            _fuerzaInicial * _body.mass; // 📌 Ajuste de impulso
        print("💥 Lanzando dinamita con fuerza: $impulso");
        _body.applyLinearImpulse(impulso);
      } else {
        print("❌ Error: El cuerpo de la dinamita aún no está listo");
      }
    });

    return _body;
  }
}
