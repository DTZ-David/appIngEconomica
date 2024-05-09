import 'package:flutter/material.dart';

class InteresSimple extends StatefulWidget {
  const InteresSimple({Key? key}) : super(key: key);

  @override
  _InteresSimpleState createState() => _InteresSimpleState();
}

class _InteresSimpleState extends State<InteresSimple> {
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController interestCapitalController = TextEditingController();
  double simpleInterest = 0.0;
  double? principalFromInterestCapital;
  String? porcentajeFormatted;
  String? tiempoInvertido;

  void calcularInteresSimple() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    int years = int.tryParse(yearsController.text) ?? 0;
    int months = int.tryParse(monthsController.text) ?? 0;
    int days = int.tryParse(daysController.text) ?? 0;
    double interestCapital =
        double.tryParse(interestCapitalController.text) ?? 0.0;

    // Si se proporciona el capital de interés, calcular el principal

    // Convertir años, meses y días a años
    double tiempoTotal = years + months / 12 + days / 365;

    setState(() {
      if (tiempoTotal == 0.0) {
        double aux = interestCapital - principal;
        tiempoTotal = aux / (principal * (rate / 100));
        double meses = tiempoTotal * 12; // Declarar meses como double
        if (meses > 12) {
          double anios = meses / 12;
          tiempoInvertido =
              '${anios.toStringAsFixed(1)} Años'; // Mostrar solo un decimal
        } else {
          tiempoInvertido =
              '${meses.toStringAsFixed(1)} meses'; // Mostrar solo un decimal
        }
      }

      if (rate == 0.0) {
        double aux = interestCapital - principal;
        double porcentaje = (aux / interestCapital) * 100;
        porcentajeFormatted = '${porcentaje.toStringAsFixed(2)}%';
      }
      if (principal == 0.0) {
        principalFromInterestCapital =
            interestCapital / (tiempoTotal * (rate / 100));
      }

      if (principal > 0) {
        simpleInterest = principal * rate * tiempoTotal / 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interés Simple'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: principalController,
                  decoration: const InputDecoration(
                    labelText: 'Capital Inicial',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: rateController,
                  decoration: const InputDecoration(
                    labelText: 'Tasa de Interés',
                  ),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: yearsController,
                        decoration: const InputDecoration(
                          labelText: 'Años',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: monthsController,
                        decoration: const InputDecoration(
                          labelText: 'Meses',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: daysController,
                        decoration: const InputDecoration(
                          labelText: 'Días',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: interestCapitalController,
                  decoration: const InputDecoration(
                    labelText: 'Capital de Interés',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calcularInteresSimple,
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Interés Simple: $simpleInterest',
                  style: const TextStyle(fontSize: 18),
                ),
                if (principalFromInterestCapital != null)
                  Text(
                    'Capital Inicial Calculado: $principalFromInterestCapital',
                    style: const TextStyle(fontSize: 18),
                  ),
                if (porcentajeFormatted != null)
                  Text(
                    'Porcentaje Calculado: $porcentajeFormatted',
                    style: const TextStyle(fontSize: 18),
                  ),
                if (tiempoInvertido != null)
                  Text(
                    'Tiempo Calculado: $tiempoInvertido',
                    style: const TextStyle(fontSize: 18),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
