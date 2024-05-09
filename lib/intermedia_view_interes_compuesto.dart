import 'package:flutter/material.dart';
import 'package:intereses_ing_economica/teoria_ineteres_compuesto.dart';
import 'package:intereses_ing_economica/interes_compuesto.dart';

class IntermediaViewInteresCompuesto extends StatelessWidget {
  const IntermediaViewInteresCompuesto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interés Compuesto'),
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
                      builder: (context) => const TeoriaInteresCompuestoView()),
                );
              },
              child: const Text('Ver Teoría de Interés Compuesto'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InteresCompuesto()),
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
