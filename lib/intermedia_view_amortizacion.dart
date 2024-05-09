import 'package:flutter/material.dart';
import 'package:intereses_ing_economica/amortizacion.dart';
import 'package:intereses_ing_economica/series_variables_gratiendes.dart';
import 'package:intereses_ing_economica/teoria_amortizacion.dart';
import 'package:intereses_ing_economica/teoria_gradientes.dart';

class IntermediaViewAmortizacion extends StatelessWidget {
  const IntermediaViewAmortizacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amortizacion'),
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
                      builder: (context) => TeoriaAmortizacionView()),
                );
              },
              child: const Text('Ver Teoría de Amortizacion'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Amortizacion()),
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
