import 'package:flutter/material.dart';

class TeoriaInteresSimpleView extends StatelessWidget {
  const TeoriaInteresSimpleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teoría del Interés Simple'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Teoría:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'El interés simple es un tipo de interés que se calcula únicamente sobre el capital inicial de una inversión. En otras palabras, el interés se calcula como un porcentaje fijo del capital original durante un período de tiempo determinado.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fórmula del Interés Simple:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/formula_interes_simple.jpg'),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            const Text(
              'Interpretación del Interés Simple:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'El interés simple es fácil de entender y calcular, pero subestima el costo de oportunidad del dinero debido a que no toma en cuenta la capitalización de los intereses ganados durante cada período.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}