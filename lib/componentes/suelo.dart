import 'package:flame_forge2d/flame_forge2d.dart';

/// Representa el suelo del juego, donde caerán los objetos físicos.
class Suelo extends BodyComponent {
  final Vector2 tamanio;

  /// Constructor que define el tamaño del suelo.
  Suelo(this.tamanio) {
    print("🛠️ Creando suelo con tamaño: $tamanio");
    renderBody =
        false; // Oculta la representación visual del cuerpo en Forge2D.
  }

  /// Crea el cuerpo físico del suelo en Forge2D.
  @override
  Body createBody() {
    print(
        "✅ Creando cuerpo del suelo en: ${tamanio.x / 2}, ${tamanio.y + 720}");

    final definicionCuerpo = BodyDef(
      position: Vector2(tamanio.x / 2,
          tamanio.y + 720), // Posiciona el suelo en la parte inferior
      type: BodyType.static, // Define el suelo como un objeto estático
    );

    final body = world.createBody(definicionCuerpo);

    // Define la forma del suelo como un rectángulo con las dimensiones especificadas.
    final forma = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);

    // Define las propiedades físicas del suelo.
    final definicionFixture = FixtureDef(forma)
      ..density = 1.0
      ..friction =
          0.5 // Aumenta la fricción para evitar deslizamientos excesivos.
      ..restitution =
          0.1 // Reduce el rebote de los objetos que colisionen con el suelo.
      ..filter.categoryBits = 0x0002; // Configuración de colisiones.

    body.createFixture(definicionFixture);

    print(
        "✅ Suelo creado en Forge2D en posición: ${definicionCuerpo.position}");
    return body;
  }
}
