import 'dart:math' as math;

import 'package:flutter/material.dart';

class InteresCompuesto extends StatefulWidget {
  const InteresCompuesto({Key? key}) : super(key: key);

  @override
  _InteresCompuestoState createState() => _InteresCompuestoState();
}

class _InteresCompuestoState extends State<InteresCompuesto> {
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController interestCapitalController = TextEditingController();

  String compoundFreq = 'Anual'; // Valor predeterminado
  double compoundInterest = 0.0;
  double? principalFromInterestCapital;
  String? porcentajeFormatted;
  String? tiempoInvertido;

  void calcularInteresCompuesto() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    int years = int.tryParse(yearsController.text) ?? 0;
    int months = int.tryParse(monthsController.text) ?? 0;
    int days = int.tryParse(daysController.text) ?? 0;
    double interestCapital =
        double.tryParse(interestCapitalController.text) ?? 0.0;
    // Convertir años, meses y días a años
    double tiempoTotal = years + months / 12 + days / 365;
    tiempoTotal = tiempoTotal * 12;
    int freqValue = 1; // Valor predeterminado
    if (compoundFreq == 'Anual') {
      freqValue = 1;
    } else if (compoundFreq == 'Semestral') {
      freqValue = 2;
    } else if (compoundFreq == 'Trimestral') {
      freqValue = 4;
    } else if (compoundFreq == 'Mensual') {
      freqValue = 12;
    }

    print(principal);
    print(tiempoTotal);
    setState(() {
      if (compoundFreq == 'Mensual') {
        rate = rate / 100;
        rate = rate / freqValue;
        rate = 1 + rate;
        compoundInterest = principal * math.pow(rate, tiempoTotal);
      }
      if (compoundFreq == "Anual") {
        if (principal == 0.0) {
          rate = rate / 100;
          principal = interestCapital / math.pow(1 + rate, years);
          principal = double.parse((principal).toStringAsFixed(2));
          principalFromInterestCapital = principal;
        } else {
          rate = rate / 100;
          rate = 1 + years * rate;
          compoundInterest = principal * rate;
        }
      }
      if (principal != 0.0 && interestCapital != 0.0) {
        double interestRate = (interestCapital / principal) - 1;
        interestRate = interestRate * 100; // Convertir a porcentaje\
        interestRate = double.parse((interestRate).toStringAsFixed(1));
        porcentajeFormatted = '$interestRate%';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interés Compuesto'),
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
                TextField(
                  controller: interestCapitalController,
                  decoration: const InputDecoration(
                    labelText: 'Capital de Interés',
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
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: compoundFreq,
                  onChanged: (String? newValue) {
                    setState(() {
                      compoundFreq = newValue!;
                    });
                  },
                  items: <String>['Anual', 'Mensual']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calcularInteresCompuesto,
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Interés Compuesto: $compoundInterest',
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
