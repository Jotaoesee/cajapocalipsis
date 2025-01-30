import 'package:flame_forge2d/flame_forge2d.dart';

/// Pelota que el jugador lanza
class Pelota extends BodyComponent {
  final Vector2 posicion;
  final double radio;
  bool haSidoLanzada = false; // Controla si la pelota ya se lanzó

  Pelota(this.posicion, {this.radio = 5});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = true;
    print("Pelota creada en posición: $posicion");
  }

  @override
  Body createBody() {
    final definicionCuerpo = BodyDef(
      position: posicion,
      type: haSidoLanzada
          ? BodyType.dynamic
          : BodyType.kinematic, // Inicialmente quieta
    );

    final body = world.createBody(definicionCuerpo);

    final forma = CircleShape()..radius = radio;
    final definicionFixture = FixtureDef(forma)
      ..density = 1.0
      ..friction = 0.3
      ..restitution = 0.6;

    body.createFixture(definicionFixture);
    return body;
  }

  /// Lanza la pelota cambiando su tipo a dinámico
  void lanzar(Vector2 fuerza) {
    if (!haSidoLanzada) {
      haSidoLanzada = true;
      body.setType(BodyType.dynamic); // Ahora sí es afectada por la gravedad
      body.applyLinearImpulse(fuerza);
    }
  }
}
