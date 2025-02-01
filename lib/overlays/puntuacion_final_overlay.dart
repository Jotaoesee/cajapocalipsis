import 'package:flutter/material.dart';
import 'package:cajapocalipsis/cajapocalipsis.dart';

class PuntuacionFinalOverlay extends StatelessWidget {
  final Cajapocalipsis juego;

  const PuntuacionFinalOverlay({Key? key, required this.juego})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7), // Fondo oscuro semitransparente
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '🎉 ¡Juego Terminado! 🎉',
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Cajas destruidas: ${juego.puntuacion}',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Tiempo restante: ${juego.contadorTiempo.tiempoRestante.toStringAsFixed(0)}s',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
