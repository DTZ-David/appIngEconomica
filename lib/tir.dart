// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';

class TIR extends StatefulWidget {
  const TIR({Key? key}) : super(key: key);

  @override
  _TIREstado createState() => _TIREstado();
}

class _TIREstado extends State<TIR> {
  final TextEditingController controladorInversionInicial =
      TextEditingController();
  final List<TextEditingController> controladoresFlujosAnuales = [];
  int? cantidadAniosSeleccionados = 1;
  double tir = 0.0;

  @override
  void initState() {
    super.initState();
    controladoresFlujosAnuales.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in controladoresFlujosAnuales) {
      controller.dispose();
    }
    super.dispose();
  }

  void _actualizarCantidadAniosSeleccionados(int? valor) {
    setState(() {
      cantidadAniosSeleccionados = valor;
      controladoresFlujosAnuales.clear();
      for (int i = 0; i < (cantidadAniosSeleccionados ?? 1); i++) {
        controladoresFlujosAnuales.add(TextEditingController());
      }
    });
  }

  void _calcularTIR() {
    double inversionInicial = double.parse(controladorInversionInicial.text);
    List<double> flujosAnuales = controladoresFlujosAnuales
        .map((controller) => double.parse(controller.text))
        .toList();

    double tirCalculada = calcularTIR(inversionInicial, flujosAnuales);
    setState(() {
      tir = tirCalculada;
    });
  }

  double calcularTIR(double inversionInicial, List<double> flujosAnuales) {
    double tirInicial = 0.1; // Aproximación inicial
    double tirAnterior = tirInicial;
    double tirActual = tirInicial;

    double van = 0.0;
    double epsilon = 0.0001; // Margen de error aceptable

    do {
      tirAnterior = tirActual;
      van = inversionInicial;
      for (int i = 0; i < flujosAnuales.length; i++) {
        van += flujosAnuales[i] / pow(1 + tirAnterior, i + 1);
      }
      double derivada = -inversionInicial;
      for (int i = 0; i < flujosAnuales.length; i++) {
        derivada += flujosAnuales[i] / pow(1 + tirAnterior, i + 2) * (i + 1);
      }
      tirActual = tirAnterior - van / derivada;
    } while ((tirActual - tirAnterior).abs() > epsilon);

    return tirActual;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de TIR'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controladorInversionInicial,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Inversión Inicial'),
            ),
            DropdownButtonFormField<int>(
              value: cantidadAniosSeleccionados,
              onChanged: _actualizarCantidadAniosSeleccionados,
              items: List.generate(
                10,
                (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text('${index + 1} Años'),
                ),
              ),
              decoration: InputDecoration(labelText: 'Número de Años'),
            ),
            ...List.generate(
              cantidadAniosSeleccionados ?? 1,
              (index) => TextFormField(
                controller: controladoresFlujosAnuales[index],
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Flujo Anual Año ${index + 1}'),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calcularTIR,
              child: Text('Calcular TIR'),
            ),
            SizedBox(height: 16.0),
            Text(
              'TIR: ${(tir * 100).toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
