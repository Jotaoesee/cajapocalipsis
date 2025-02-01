import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';

/// Representa la dinamita en el juego.
/// Es un cuerpo dinámico que se lanza con una fuerza inicial y colisiona con otros objetos.
class Dinamita extends BodyComponent {
  final Vector2 posicion;
  final Vector2 _fuerzaInicial;
  final Vector2 spriteSize; // Tamaño del sprite en píxeles
  final Vector2 bodySize; // Tamaño del cuerpo de física en unidades del motor

  late Body _body;

  /// Constructor de la dinamita.
  /// - `posicion`: Posición inicial en el mundo del juego.
  /// - `fuerzaInicial`: Fuerza con la que se lanzará la dinamita.
  /// - `spriteSize`: Opcional, define el tamaño visual de la dinamita.
  /// - `bodySize`: Opcional, define el tamaño del cuerpo físico.
  Dinamita(
    this.posicion,
    this._fuerzaInicial, {
    Vector2? spriteSize,
    Vector2? bodySize,
  })  : spriteSize = spriteSize ?? Vector2(120, 160),
        bodySize = bodySize ?? Vector2(40, 60);

  /// Carga el sprite de la dinamita y lo agrega como un componente visual.
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sprite = await Sprite.load('dinamita.png');
    add(SpriteComponent(
      sprite: sprite,
      size: spriteSize,
      anchor: Anchor.center,
      position: Vector2.zero(),
    ));

    print("💣 Dinamita creada en: $posicion");
  }

  /// Crea el cuerpo físico de la dinamita en Forge2D.
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: posicion,
      type: BodyType.dynamic, // Permite que la dinamita se mueva libremente
      linearDamping: 0.0, // No hay resistencia al movimiento lineal
      angularDamping: 0.5, // Resistencia a la rotación
    );

    _body = world.createBody(bodyDef);
    _body.userData = this; // Permite identificar la dinamita en colisiones

    final shape = PolygonShape()..setAsBoxXY(bodySize.x / 2, bodySize.y / 2);
    final fixtureDef = FixtureDef(shape)
      ..density = 2.0 // Controla la masa
      ..friction = 0.3 // Controla la fricción con otras superficies
      ..restitution = 0.1 // Define el rebote de la dinamita
      ..filter.maskBits =
          0xFFFF; // Permite que la dinamita colisione con otros objetos

    _body.createFixture(fixtureDef);

    // Aplica la fuerza inicial para lanzar la dinamita.
    final Vector2 impulso = _fuerzaInicial;
    print("💥 Lanzando dinamita con fuerza: $impulso");
    _body.applyLinearImpulse(impulso);

    return _body;
  }
}
