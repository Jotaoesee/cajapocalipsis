import 'dart:ui';
import 'package:cajapocalipsis/componentes/explosion.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:cajapocalipsis/componentes/dinamita.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

/// Representa una caja destructible en el juego.
/// Al colisionar con la dinamita, genera una explosión y aumenta la puntuación.
class Caja extends BodyComponent<Cajapocalipsis>
    with ContactCallbacks, HasGameRef<Cajapocalipsis> {
  final Vector2 tamanio;
  final Vector2 posicion;

  Caja(this.posicion, this.tamanio);

  /// Carga la imagen de la caja y la agrega como un `SpriteComponent`
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = await Sprite.load('caja.png');
    print("✅ Imagen de la caja cargada con transparencia: ${sprite.srcSize}");

    add(SpriteComponent(
      sprite: sprite,
      size: Vector2(118, 118),
      anchor: Anchor.center,
      paint: Paint()
        ..color = const Color(0xFFFFFFFF)
        ..blendMode =
            BlendMode.srcATop, // Asegura que el sprite tenga transparencia
    ));
  }

  /// Crea el cuerpo físico de la caja en Forge2D.
  @override
  Body createBody() {
    final definicionCuerpo = BodyDef(
      position: posicion,
      type: BodyType.dynamic, // La caja puede moverse y colisionar
    );

    final cuerpo = world.createBody(definicionCuerpo);
    cuerpo.userData = this; // Permite identificar este objeto en colisiones

    final shape = PolygonShape()..setAsBoxXY(tamanio.x / 2, tamanio.y / 2);
    final definicionFixture = FixtureDef(shape)
      ..density = 1.0 // Define la masa de la caja
      ..friction = 0.5 // Controla la resistencia al deslizamiento
      ..restitution = 0.2; // Define el rebote al colisionar

    cuerpo.createFixture(definicionFixture);
    return cuerpo;
  }

  /// Detecta colisiones con otros objetos del juego.
  @override
  void beginContact(Object otro, Contact contact) {
    super.beginContact(otro, contact);

    if (otro is Dinamita) {
      print("💥 ¡Colisión detectada entre Caja y Dinamita!");

      // Incrementa la puntuación del jugador
      gameRef.puntuacion++;

      // Genera una explosión en la posición de la caja
      final explosion = Explosion(
        posicion: body.position,
        tamanio: Vector2.all(50), // Tamaño reducido para la explosión
      )..priority = 100; // Se renderiza sobre otros elementos

      gameRef.add(explosion);

      // Elimina la caja y la dinamita de la escena
      removeFromParent();
      otro.removeFromParent();
    }
  }
}
