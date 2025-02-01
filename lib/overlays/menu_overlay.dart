import 'package:flutter/material.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart'; // Asegúrate de que la ruta es correcta

class MenuOverlay extends StatelessWidget {
  final Cajapocalipsis juego;

  const MenuOverlay({Key? key, required this.juego}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // El contenedor principal con la imagen de fondo
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo_overlay.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Una capa adicional con un color oscuro semitransparente para mejorar la legibilidad
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
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
                    'En este juego, deberás destruir cajas lanzando dinamita. '
                    'Prepárate para una explosiva aventura en un entorno apocalíptico.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Al pulsar el botón se remueve el overlay y se inicia el juego
                      juego.overlays.remove('MenuOverlay');
                    },
                    child: Text('Iniciar Juego'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      // Color del botón
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
