import 'package:flutter/material.dart';

class TeoriaAnualidadesView extends StatelessWidget {
  const TeoriaAnualidadesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teoría de Anualidades'),
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
              'Una anualidad es una serie de pagos iguales realizados o recibidos a intervalos regulares durante un período de tiempo específico. Estos pagos pueden ser depósitos en una cuenta de ahorros, cuotas de préstamos, pagos de alquiler u otros gastos regulares. La teoría de las anualidades es fundamental en la planificación financiera y en el cálculo de préstamos, inversiones y seguros.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fórmula de la Anualidad:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/formula_anualidades.jpg'),
            const SizedBox(height: 10),
            const Text(
              'Donde:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'i = Es la tasa de interés aplicada en cada período.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'r = Tasa de interés por período, expresada como un decimal.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'n = Número total de pagos o períodos.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'PV = Valor presente o valor actual de la anualidad.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Interpretación de las Anualidades:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Las anualidades son útiles para planificar y presupuestar pagos regulares. Al comprender las fórmulas y conceptos asociados con las anualidades, es posible determinar cuánto será necesario ahorrar o pagar en el futuro, teniendo en cuenta la tasa de interés y el número de pagos. Esto es esencial para la gestión financiera personal y empresarial.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
