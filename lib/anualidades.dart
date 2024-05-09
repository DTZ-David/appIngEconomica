import 'package:flutter/material.dart';
import 'dart:math';

class Anualidades extends StatefulWidget {
  const Anualidades({Key? key}) : super(key: key);

  @override
  _AnualidadesState createState() => _AnualidadesState();
}

class _AnualidadesState extends State<Anualidades> {
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController periodsController = TextEditingController();
  double annuity = 0.0;

  void calculateAnnuity() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    int periods = int.tryParse(periodsController.text) ?? 0;

    setState(() {
      annuity = (principal * rate) / (1 - pow(1 + rate, -periods));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anualidades'),
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
                    labelText: 'Tasa de Interés (por período)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: periodsController,
                  decoration: const InputDecoration(
                    labelText: 'Número de Períodos',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateAnnuity,
                  child: const Text('Calcular Anualidad'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Anualidad: $annuity',
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
