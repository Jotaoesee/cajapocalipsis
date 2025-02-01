import 'package:flutter/material.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

/// Overlay de la puntuación final que aparece al terminar el juego.
class PuntuacionFinalOverlay extends StatelessWidget {
  final Cajapocalipsis juego;

  const PuntuacionFinalOverlay({super.key, required this.juego});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color:
              Colors.black.withOpacity(0.7), // Fondo oscuro semitransparente.
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "¡Juego Terminado!",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Cajas destruidas: ${juego.puntuacion}",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                "Tiempo restante: ${juego.contadorTiempo.tiempoRestante.toStringAsFixed(0)} s",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  juego.overlays
                      .remove('PuntuacionFinalOverlay'); // Cierra el overlay.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                child: Text("Reiniciar Juego"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
