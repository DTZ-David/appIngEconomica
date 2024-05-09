import 'package:flutter/material.dart';
import 'package:intereses_ing_economica/teoria_interes_simple.dart';
import 'package:intereses_ing_economica/interes_simple.dart';

class IntermediaViewInteresSimple extends StatelessWidget {
  const IntermediaViewInteresSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interés Simple'),
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
                      builder: (context) =>const TeoriaInteresSimpleView()),
                );
              },
              child: const Text('Ver Teoría de Interés Simple'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InteresSimple()),
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