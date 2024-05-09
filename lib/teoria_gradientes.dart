import 'package:flutter/material.dart';

class TeoriaGradientsView extends StatefulWidget {
  @override
  _TeoriaGradientsViewState createState() => _TeoriaGradientsViewState();
}

class _TeoriaGradientsViewState extends State<TeoriaGradientsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teoría de Series Variables o Gradientes'),
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
              'En ingeniería económica, las series variables o gradientes se refieren a flujos de efectivo en los que las cantidades cambian en cada período de tiempo. Esto puede ocurrir en situaciones como préstamos con pagos crecientes o depreciación de activos.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Gradiente Aritmetico:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'En este tipo de transacciones, los pagos aumentan gradualmente en cada período, es decir, aumentan en forma aritmética. Sobre el gradiente es posible calcular al menos dos momentos de consolidación de todos sus valores: al principio de la serie de pagos (Valor Presente) y al final de la serie de pagos (Valor Futuro).',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fórmula:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/GradienteAritmetico.png'),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const Text(
              'Donde: para Gradiente Aritmetico',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'VP = Valor Presente del gradiente',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'VF = Valor Futuro del gradiente',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'G = Cantidad en que se incrementa o disminuye el pago periódico',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'I = Tasa de Interés',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'N = Número de períodos',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Gradiente Geometrico:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '''En algunas transacciones se construyen series de pagos cuyo comportamiento consiste en un crecimiento geométrico, es decir, cada pago corresponde alanterior, multiplicado por un número llamado razón (r).  la "razón" (denotada como r) se refiere al factor de crecimiento que se aplica a cada pago para obtener el siguiente.''',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fórmula:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/GradienteGeometrico.png'),
            const Text(
              'Donde: para Gradiente Aritmetico',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'VP = Valor Presente del gradiente',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'VF = Valor Futuro del gradiente',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'K = Cantidad en que se incrementa o disminuye el pago periódico (G)',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'I = Tasa de Interés',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'N = Número de períodos',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'R = Razon',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
