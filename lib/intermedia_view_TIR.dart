import 'package:flutter/material.dart';
import 'package:intereses_ing_economica/teoria_TIR.dart';
import 'package:intereses_ing_economica/tir.dart';

class IntermediaViewTIR extends StatelessWidget {
  const IntermediaViewTIR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIR'),
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
                      builder: (context) => const TeoriaTIRView()),
                );
              },
              child: const Text('Ver Teoría de TIR'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TIR()),
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
