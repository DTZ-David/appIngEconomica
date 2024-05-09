import 'package:flutter/material.dart';

class TeoriaInteresCompuestoView extends StatelessWidget {
  const TeoriaInteresCompuestoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teoría del Interés Compuesto'),
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
              'El interés compuesto es un tipo de interés en el que los intereses se añaden al capital inicial, y a su vez generan intereses. Esto significa que el interés ganado en cada período se calcula sobre el capital acumulado, incluyendo tanto el capital original como los intereses acumulados de períodos anteriores.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fórmula del Interés Compuesto:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/formula_interes_compuesto.jpg'),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            const Text(
              'Interpretación del Interés Compuesto:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'El interés compuesto es una forma poderosa de hacer crecer el capital debido a la capitalización de los intereses ganados en cada período. Con el tiempo, el interés compuesto puede generar un crecimiento exponencial del capital inicial, lo que lo convierte en una opción atractiva para la inversión a largo plazo.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
