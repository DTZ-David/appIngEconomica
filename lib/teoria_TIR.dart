import 'package:flutter/material.dart';

class TeoriaTIRView extends StatelessWidget {
  const TeoriaTIRView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teoría de Tasa Interna de Retorno (TIR)'),
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
              'La Tasa Interna de Retorno (TIR) es una medida utilizada en la evaluación de proyectos de inversión que calcula la tasa de rendimiento de una inversión en función de sus flujos de efectivo esperados. En otras palabras, la TIR es la tasa de interés que hace que el valor presente neto (VPN) de los flujos de efectivo de un proyecto de inversión sea igual a cero.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Interpretación de la TIR:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'La interpretación de la TIR se basa en la comparación de la TIR calculada con la tasa de descuento o costo de capital requerida para el proyecto. Generalmente, se dice que un proyecto es viable si su TIR es mayor que la tasa de descuento. Si la TIR es menor que la tasa de descuento, el proyecto puede no ser viable.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cálculo de la TIR:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/TIR.png'),
            const SizedBox(height: 10),
            const Text(
              'El cálculo de la TIR implica encontrar la tasa de interés que hace que el valor presente neto (VPN) de los flujos de efectivo de un proyecto sea cero. Esto generalmente se realiza mediante métodos numéricos o con el uso de software especializado.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
