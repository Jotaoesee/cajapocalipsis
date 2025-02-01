import 'package:flutter/material.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';
import 'package:flame_audio/flame_audio.dart';

/// Overlay del menú principal del juego.
class MenuOverlay extends StatelessWidget {
  final Cajapocalipsis juego;

  const MenuOverlay({Key? key, required this.juego}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo_overlay.png'),
            fit: BoxFit.cover, // Ajusta la imagen al fondo de la pantalla.
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(
                0.6), // Capa oscura semitransparente para mejor legibilidad.
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cajapocalipsis',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '¡Bienvenido a Cajapocalipsis!\n\n'
                    'Destruye todas las cajas lanzando dinamita. '
                    'Prepárate para una explosiva aventura en un mundo apocalíptico.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Inicia la música de fondo cuando el jugador presiona "Iniciar Juego".
                      FlameAudio.bgm.initialize();
                      FlameAudio.bgm.play('musica_fondo.mp3', volume: 0.5);
                      print("🎵 Música de fondo iniciada");

                      // Oculta el overlay para comenzar la partida.
                      juego.overlays.remove('MenuOverlay');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Iniciar Juego'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
