import 'package:flame_forge2d/flame_forge2d.dart';

/// Pelota que el jugador lanza
class Pelota extends BodyComponent {
  final Vector2 posicion;
  final double radio;

  Pelota(this.posicion, {this.radio = 20}) : super();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = true; // Activar el renderizado
    print(
        "Pelota creada en posición: $posicion"); // Verificar si la pelota se está agregando
  }

  @override
  Body createBody() {
    final definicionCuerpo = BodyDef(
      position: posicion,
      type: BodyType.dynamic,
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

  /// Aplica una fuerza a la pelota para lanzarla
  void lanzar(Vector2 fuerza) {
    if (isMounted) {
      body.applyLinearImpulse(fuerza);
    }
  }
}
