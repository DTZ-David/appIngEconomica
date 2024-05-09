import 'package:flutter/material.dart';
import 'package:intereses_ing_economica/teoria_anualidades.dart';
import 'package:intereses_ing_economica/anualidades.dart';

class IntermediaViewAnualidades extends StatelessWidget {
  const IntermediaViewAnualidades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anualidades'),
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
                      builder: (context) => const TeoriaAnualidadesView()),
                );
              },
              child: const Text('Ver Teoría de Anualidades'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Anualidades()),
                );
              },
              child: const Text('Ir a la calculadora de Anualidades'),
            ),
          ],
        ),
      ),
    );
  }
}
