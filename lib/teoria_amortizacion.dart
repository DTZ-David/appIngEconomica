import 'package:flutter/material.dart';

class TeoriaAmortizacionView extends StatelessWidget {
  const TeoriaAmortizacionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teoría de Amortización'),
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
              'La amortización se refiere al proceso de pago gradual de una deuda a lo largo del tiempo mediante pagos regulares. Este proceso es común en préstamos, hipotecas y otros tipos de financiamiento.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Métodos de Amortización:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Existen varios métodos de amortización, entre ellos:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              '- Amortización Constante: Los pagos son constantes en cada período, mientras que el monto aplicado a los intereses disminuye con el tiempo.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Sistema Francés (Cuota Fija): Los pagos son constantes en cada período, pero el monto aplicado a los intereses disminuye con el tiempo y el monto aplicado al capital aumenta.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Amortización Gradual: Los pagos aumentan o disminuyen en cada período, generalmente en función de la capacidad de pago del deudor.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fórmula de Amortización:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/Amortizacion.jpg'),
            const Text(
              'La fórmula para calcular el pago constante de amortización es:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const Text(
              'En nuestro caso:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Monto = La cantidad prestada (R)',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Tasa de interes =% de intereses (i)',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Fecha de inicio y fin = El periodo de tiempo de la deuda (n)',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Frecuencia de pago: Anual, Mensual, Trimestral',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Y si existe o no un plan de pago que es el monto de pago con frecuencia (A)',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
