import 'package:flutter/material.dart';
import 'package:intereses_ing_economica/amortizacion.dart';
import 'package:intereses_ing_economica/capitalizacion.dart';

import 'package:intereses_ing_economica/teoria_capitalizacion.dart';

class IntermediaViewCapitalizacion extends StatelessWidget {
  const IntermediaViewCapitalizacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capitalizacion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TeoriaCapitalizacionView()),
                );
              },
              child: const Text('Ver Teoría de Capitalizacion'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Capitalizacion()),
                );
              },
              child: const Text('Ir a la calculadora'),
            ),
          ],
        ),
      ),
    );
  }
}
