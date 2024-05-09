import 'package:flutter/material.dart';
import 'package:intereses_ing_economica/series_variables_gratiendes.dart';
import 'package:intereses_ing_economica/teoria_gradientes.dart';

class IntermediaViewGradientes extends StatelessWidget {
  const IntermediaViewGradientes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradientes'),
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
                      builder: (context) => TeoriaGradientsView()),
                );
              },
              child: const Text('Ver Teoría de Series Variables o Gradientes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Gradientes()),
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
