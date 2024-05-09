// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';

class Gradientes extends StatefulWidget {
  const Gradientes({Key? key}) : super(key: key);

  @override
  _GradientesState createState() => _GradientesState();
}

class _GradientesState extends State<Gradientes> {
  TextEditingController MontoController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();
  TextEditingController NumeroPeriodosController = TextEditingController();
  TextEditingController RazonGeometricoController = TextEditingController();

  String dropdownValue = 'Gradiente Aritmético';

  var vp;
  var vf;

  void calcularGradientes() {
    double monto = double.parse(MontoController.text);
    double tasaInteres = double.parse(tasaInteresController.text);
    double numeroPeriodos = double.parse(NumeroPeriodosController.text);

    // Convertir la tasa de interés a un valor decimal (porcentaje)
    double tasaInteresDecimal = tasaInteres / 100.0;

    if (dropdownValue == 'Gradiente Aritmético') {
      vp = 'No existe VP para gradiente aritmético';
      vf = ((pow((1 + tasaInteresDecimal), numeroPeriodos)));
      print(vf);
      vf = (vf - 1 - numeroPeriodos * tasaInteresDecimal) /
          pow(tasaInteresDecimal, 2);
      print(vf);
      vf = monto * vf;
      print(vf);
      vf = double.parse(vf.toStringAsFixed(2));
    } else {
      vp = monto;
      double razonGeometrico = double.parse(RazonGeometricoController.text);
      vf = ((pow((1 + tasaInteresDecimal), numeroPeriodos)));
      vf = vf - ((pow((1 + razonGeometrico), numeroPeriodos)));
      vf = vf / (tasaInteresDecimal - razonGeometrico);
      vf = monto * vf;
      vf = double.parse(vf.toStringAsFixed(2));
      vp = ((pow((1 + tasaInteresDecimal), numeroPeriodos)));
      vp = vp - ((pow((1 + razonGeometrico), numeroPeriodos)));
      vp = (vp / (tasaInteresDecimal - razonGeometrico)) *
          ((pow((1 + tasaInteresDecimal), -numeroPeriodos)));
      vp = monto * vp;
      vp = double.parse(vp.toStringAsFixed(2));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Series Variables y Gradientes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Gradiente Aritmético', 'Gradiente Geométrico']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: MontoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Monto (g)'),
            ),
            TextField(
              controller: tasaInteresController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Tasa de Interés (i)'),
            ),
            TextField(
              controller: NumeroPeriodosController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Número de Períodos (n)'),
            ),
            if (dropdownValue == 'Gradiente Geométrico')
              TextField(
                controller: RazonGeometricoController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Razón del Gradiente (r)'),
              ),
            ElevatedButton(
              onPressed: calcularGradientes,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text('Valor Presente (VP): $vp'),
            Text('Valor Futuro (VF): $vf'),
          ],
        ),
      ),
    );
  }
}
